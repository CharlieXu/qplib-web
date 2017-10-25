#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <assert.h>
#include <math.h>
#include <time.h>

#include "gmomcc.h"
#include "gevmcc.h"

#include "def.h"
#include "loadgms.h"
#include "pointcheck.h"

#define SOLVER "conopt"

int savedoriggdx = 0;

RETURN saveoriggdx(char* name)
{
   char buffer[1024];
   int rc;

   if( savedoriggdx )
      return RETURN_OK;

   snprintf(buffer, sizeof(buffer), "/bin/cp -p \'%s\' \'%s.old%ju\'", name, name, time(NULL));
   buffer[sizeof(buffer)-1] = '\0';

   rc = system(buffer);
   if( rc != 0 )
   {
      fprintf(stderr, "cp call returned with code %d\n", rc);
      return RETURN_ERROR;
   }

   savedoriggdx = 1;

   return RETURN_OK;
}

RETURN loadSol(gmoHandle_t gmo, char* filename)
{
   FILE* f;
   char* line;
   size_t linelength = 255;
   char varname[GMS_SSSIZE];
   char buffer[GMS_SSSIZE];
   char varvalstr[GMS_SSSIZE];
   float varval;
   int i;
   
   f = fopen(filename, "r");
   if( f == NULL )
      return RETURN_ERROR;
   
   line = (char*) malloc(linelength * sizeof(char));
   while( getline(&line, &linelength, f) > 0 )
   {
      sscanf(line, "%s %s\n", varname, varvalstr);
      varval = strtod(varvalstr, NULL);
      for( i = 0; i < gmoN(gmo); ++i )
      {
         gmoGetVarNameOne(gmo, i, buffer);
         if( strcmp(buffer, varname) == 0 )
         {
            gmoSetVarLOne(gmo, i, varval);
            break;
         }
      }
   }
      
   return RETURN_OK;
}

/** adjusts level values of variables in GMO to satisfy bound and integrality constraints exactly */
RETURN satisfyBounds(gmoHandle_t gmo, int* changedpoint)
{
   char buffer[200];
   int i;

   assert(changedpoint != NULL);

   *changedpoint = 0;
   for( i = 0; i < gmoN(gmo); ++i )
   {
      double lb;
      double ub;
      double val;
      double newval;

      lb = gmoGetVarLowerOne(gmo, i);
      ub = gmoGetVarUpperOne(gmo, i);
      val = gmoGetVarLOne(gmo, i);

      gmoSetAltVarLowerOne(gmo, i, lb);
      gmoSetAltVarUpperOne(gmo, i, ub);

      switch( gmoGetVarTypeOne(gmo, i) )
      {
         case gmovar_B :
         case gmovar_I :
         {
            /* round value to integer and project onto bounds */
            newval = MAX(lb, MIN(ub, round(val)));

            /* fix variable */
            gmoSetAltVarLowerOne(gmo, i, newval);
            gmoSetAltVarUpperOne(gmo, i, newval);

            break;
         }

         case gmovar_S1 :
         case gmovar_S2 :
         {
            newval = MAX(lb, MIN(ub, val));

            /* round SOS variables close to 0.0 to 0.0 and fix them */
            if( fabs(newval) < 1e-9 )
            {
               newval = 0.0;

               /* fix variable */
               gmoSetAltVarLowerOne(gmo, i, newval);
               gmoSetAltVarUpperOne(gmo, i, newval);
            }

            break;
         }

         case gmovar_SC :
         case gmovar_SI :
         {
            assert(lb >= 0.0);

            /* if below 0, set to 0
             * if slightly above 0 and lb > 1e-9, also set to 0
             */
            if( val < 1e-9 && (lb > 1e-9 || val < 0.0) )
               newval = val;
            else
               newval = MAX(lb, MIN(ub, val));

            if( gmoGetVarTypeOne(gmo, i) == gmovar_SI )
               newval = round(newval);

            if( lb > 0.0 )
            {
               if( newval == 0.0 )
               {
                  /* fix variable to 0 */
                  gmoSetAltVarLowerOne(gmo, i, newval);
                  gmoSetAltVarUpperOne(gmo, i, newval);
               }
               /* else keep original bounds; variable type change should then rule out the 0.0 choice */
            }

            break;
         }

         case gmovar_X :
         {
            newval = MAX(lb, MIN(ub, val));
            break;
         }

         default :
         {
            fprintf(stderr, "Unsupported variable type for variable %d\n", i);
            return RETURN_ERROR;
         }
      }

      if( newval != val )
      {
         *changedpoint = 1;

         gmoGetVarNameOne(gmo, i, buffer);
         printf("  Variable %s [%g, %g]: value moved: %.20g -> %.20g (by %e)\n", buffer, lb, ub, val, newval, fabs(newval - val));
      }

      gmoSetVarLOne(gmo, i, newval);
   }

   return RETURN_OK;
}

int main(int argc, char** argv)
{
   gmoHandle_t gmo;
   gevHandle_t gev;
   char buffer[1024];
   double infeas;
   double infeasnew;
   double origobj;
   int changedpoint;
   int rc;
   FILE* solveropt;
   double* varmarginals = NULL;

   if( argc < 3 || strlen(argv[2]) < 4 )
   {
      printf("usage: %s <instance.gms> <point.gdx | point.sol>\n", argv[0]);
      return EXIT_FAILURE;
   }

   /* load GAMS model */
   CHECK( loadGMS(&gmo, &gev, argv[1]) );

   /* load GDX file */
   if( strcasecmp(&argv[2][strlen(argv[2])-4], ".gdx") == 0 )
   {
      /* currently do not load equation values (don't need them anyway) to work around GMO bug */
      rc = gmoLoadSolutionGDX(gmo, argv[2], 0, 1, 0);
      if( rc != 0 )
      {
         fprintf(stderr, "Could not load GDX file %s\n", argv[2]);
         goto TERMINATE;
      }
   }
   else if( strcasecmp(&argv[2][strlen(argv[2])-4], ".sol") == 0 )
   {
      CHECK( loadSol(gmo, argv[2]) );
      strcpy(&argv[2][strlen(argv[2])-4], ".gdx");
      savedoriggdx = 1;
   }
   else
   {
       printf("Error: need to be .gdx or .sol point file\n");
       goto TERMINATE;
   }

   gmoCompleteSolution(gmo);
   if( gmoModelType(gmo) == gmoProc_cns )
      gmoSetHeadnTail(gmo, gmoHobjval, 0.0);

   /* zero array to scrub variable marginals */
   varmarginals = (double*) malloc(gmoN(gmo) * sizeof(double));
   memset(varmarginals, 0, gmoN(gmo) * sizeof(double));

   /* rewrite GDX file with variable values only, marginals and equation values scrubbed */
   gmoSetVarM(gmo, varmarginals);
   gmoUnloadSolutionGDX(gmo, argv[2], 0, 1, 0);

   /* get infeasibility of input point */
   CHECK( pointInfeasibility(gmo, gev, &infeas) );

   origobj = gmoGetHeadnTail(gmo, gmoHobjval);
   printf("Input    point: Infeasibility: %e  Objective: %.20g\n", infeas, origobj);

   CHECK( satisfyBounds(gmo, &changedpoint) );
   if( changedpoint )
   {
      printf("Fixing variables changed point\n");

      gmoCompleteSolution(gmo);

      /* get infeasibility of changed point */
      CHECK( pointInfeasibility(gmo, gev, &infeasnew) );

      printf("Changed  point: Infeasibility: %e  Objective: %.20g\n", infeasnew, gmoGetHeadnTail(gmo, gmoHobjval));

      /* backup original GDX */
      CHECK( saveoriggdx(argv[2]) );

      /* overwrite old GDX with new point */
      gmoSetVarM(gmo, varmarginals);
      gmoUnloadSolutionGDX(gmo, argv[2], 0, 1, 0);
      printf("Written changed point to %s\n", argv[2]);

      infeas = infeasnew;
   }

   /* skip local solver call if we are already quite good feasible (avoid minimal changes in points) */
   if( infeas < 1e-9 )
      goto TERMINATE;

   gmoAltBoundsSet(gmo, 1);
   gmoForceContSet(gmo, 1); /* Relax the discrete variables */
   gmoNameOptFileSet(gmo, "loadgms.tmp/" SOLVER ".opt");

   solveropt = fopen("loadgms.tmp/conopt.opt", "w");
   assert(solveropt != NULL);
   fprintf(solveropt, "rtmaxv 1E30\n");
   fprintf(solveropt, "rtmaxj 1E30\n");
   fprintf(solveropt, "rtnwmi 1e-10\n");
   fprintf(solveropt, "rtnwma 1e-9\n");
   fprintf(solveropt, "rtnwtr 1e-9\n");
   fprintf(solveropt, "lsscal f\n");
   fclose(solveropt);

   solveropt = fopen("loadgms.tmp/snopt.opt", "w");
   assert(solveropt != NULL);
   fprintf(solveropt, "scale option 0\n");
   fprintf(solveropt, "major feasibility tolerance 1e-10\n");
   fprintf(solveropt, "minor feasibility tolerance 1e-10\n");
   fclose(solveropt);

   solveropt = fopen("loadgms.tmp/minos.opt", "w");
   assert(solveropt != NULL);
   fprintf(solveropt, "scale option 0\n");
   fprintf(solveropt, "feasibility tolerance 1e-10\n");
   fprintf(solveropt, "row tolerance 1e-10\n");
   fclose(solveropt);

   /* TODO loop solvers until there is no more reduction */

   /* typedef int  (GEV_CALLCONV *gevCallSolver_t) (gevHandle_t pgev, void *gmoptr, const char *cntrfn, const char *solvername, int solvelink, int Logging, const char *logfn, const char *statfn, double reslim, int iterlim, int domlim, double optcr, double optca, void **jobhandle, char *msg); */
   rc = gevCallSolver(gev, (void*) gmo, NULL, SOLVER, gevSolveLinkCallModule, gevSolverSameStreams, NULL, NULL, 10.0, gmoValNAInt(gmo), gmoValNAInt(gmo), 0.0, 0.0, NULL, buffer);
   if( rc != 0 )
   {
      fprintf(stderr, buffer);
      goto TERMINATE;
   }

   gmoAltBoundsSet(gmo, 0);
   gmoAltVarTypesSet(gmo, 0);
   gmoForceContSet(gmo, 0); /* Relax the discrete variables */

   switch( gmoModelStat(gmo) )
   {
      case gmoModelStat_Integer :
      case gmoModelStat_Feasible :
      case gmoModelStat_OptimalGlobal :
      case gmoModelStat_OptimalLocal :
      case gmoModelStat_Solved :
      case gmoModelStat_SolvedUnique :
      case gmoModelStat_Unbounded :
      {
         double newobj;
         double objsense;

         if( gmoSolveStat(gmo) != gmoSolveStat_Normal )
            printf(SOLVER " model status: %d solve status: %d\n", gmoModelStat(gmo), gmoSolveStat(gmo));

         /* make sure returned point satisfies variable bounds */
         CHECK( satisfyBounds(gmo, &changedpoint) );

         /* get infeasibility of computed point */
         CHECK( pointInfeasibility(gmo, gev, &infeasnew) );

         newobj = gmoGetHeadnTail(gmo, gmoHobjval);
         objsense = gmoSense(gmo) == gmoObj_Min ? 1.0 : -1.0;

         printf("Polished point: Infeasibility: %e  Objective: %.20g\n", infeasnew, newobj);

         /* if infeasibility reduced and either original infeasibility was large or objective did not get worse, write out new point */
         if( infeasnew < 0.99*infeas &&
            (infeas > 1e-9 || newobj * objsense - origobj * objsense < 1e-6 * MAX(1.0, fabs(origobj))) )
         {
            CHECK( saveoriggdx(argv[2]) );

            gmoSetVarM(gmo, varmarginals);
            gmoUnloadSolutionGDX(gmo, argv[2], 0, 1, 0);
            printf("Written polished point to %s\n", argv[2]);
         }

         break;
      }

      default :
      {
         printf(SOLVER " model status: %d solve status: %d\n", gmoModelStat(gmo), gmoSolveStat(gmo));
         break;
      }
   }

TERMINATE:
   freeGMS(&gmo, &gev);

   free(varmarginals);

   return EXIT_SUCCESS;
}
