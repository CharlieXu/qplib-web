#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <assert.h>
#include <libgen.h>

#include "gmomcc.h"
#include "gevmcc.h"

#include "loadgms.h"
#include "curvcheck.h"
#include "sparsityplot.h"

static
void assignComponent(
   int* rowstart,
   int* colidx,
   int* component,
   int* componentsize,
   int row
   )
{
   int i;

   assert(component[row] != -1);

   for( i = rowstart[row]; i < rowstart[row+1]; ++i )
   {
      if( component[colidx[i]] == component[row] )
         continue;

      assert(component[colidx[i]] == -1);
      component[colidx[i]] = component[row];
      ++componentsize[component[row]];
      assignComponent(rowstart, colidx, component, componentsize, colidx[i]);
   }
}

/*
static
int intdiff(
   const void* a,
   const void* b
   )
{
   return *(int*)a - *(int*)b;
}
*/

static
RETURN analyzeHessianBlocks(
   gmoHandle_t gmo,
   gevHandle_t gev
)
{
   int* colidx = NULL;
   int* rowidx = NULL;
   int* rowstart = NULL;
   int orignz, nz;
   int row;
   int i;
   /* int do2dir, dohess; */
   int* component = NULL;
   int ncomponents;
   int* componentsize = NULL;
   int minsize;
   int maxsize;
   int sumsize;

   assert(gmo != NULL);
   assert(gev != NULL);

   /* TODO how to find out whether Hessian was already loaded? */
   /*
   do2dir = 0;
   dohess = 1;
   gmoHessLoad(gmo, 0, &do2dir, &dohess);
   if( !dohess )
   {
      fprintf(stderr, "gmoHessLoad did not succeed\n");
      return RETURN_ERROR;
   }
   */

   nz = gmoHessLagNz(gmo);

   if( 2*nz - gmoHessLagDiagNz(gmo) == gmoN(gmo) * gmoN(gmo) )
   {
      printf("NLAGHESSIANBLOCKS = 1\n");
      printf("LAGHESSIANMINBLOCKSIZE = %d\n", gmoN(gmo));
      printf("LAGHESSIANMAXBLOCKSIZE = %d\n", gmoN(gmo));
      printf("LAGHESSIANAVGBLOCKSIZE = %d\n", gmoN(gmo));

      return RETURN_OK;
   }

   colidx = (int*) malloc(2*nz * sizeof(int));
   rowidx = (int*) malloc(2*nz * sizeof(int));

   gmoHessLagStruct(gmo, rowidx, colidx);

   /* duplicate nondiagonal entries to get full hessian */
   orignz = nz;
   for( i = 0; i < orignz; ++i )
   {
      if( colidx[i] == rowidx[i] )
         continue;

      colidx[nz] = rowidx[i];
      rowidx[nz] = colidx[i];
      ++nz;
   }

   /* sort entries by (rowidx,colidx) */
   sortHessian(rowidx, colidx, nz);

   /* compute rowstart's */
   rowstart = (int*) malloc((gmoN(gmo)+1) * sizeof(int));
   i = 0;
   rowstart[0] = 0;
   for( row = 1; row < gmoN(gmo); ++row )
   {
      while( i < nz && rowidx[i] < row )
         ++i;
      rowstart[row] = i;
   }
   rowstart[gmoN(gmo)] = nz;

   /* initialize variable to component mapping */
   component = (int*) malloc(gmoN(gmo) * sizeof(int));
   componentsize = (int*) malloc(gmoN(gmo) * sizeof(int));
   for( i = 0; i < gmoN(gmo); ++i )
      component[i] = -1;

   /* identify components in sparsity graph */
   ncomponents = 0;
   minsize = gmoN(gmo);
   sumsize = 0;
   maxsize = 0;
   for( row = 0; row < gmoN(gmo); ++row )
   {
      /* skip over rows that have no entries in Hessian, i.e., linear variables */
      if( rowstart[row] == rowstart[row+1] )
         continue;

      /* if previously unseen variable, then assign it a new component number */
      if( component[row] == -1 )
      {
         component[row] = ncomponents;
         componentsize[ncomponents] = 1;

         /* assign all connected variable the same component number */
         assignComponent(rowstart, colidx, component, componentsize, row);

         /* update min, max, sum of component sizes */
         if( componentsize[ncomponents] < minsize )
            minsize = componentsize[ncomponents];
         if( componentsize[ncomponents] > maxsize )
            maxsize = componentsize[ncomponents];
         sumsize += componentsize[ncomponents];

         ++ncomponents;
      }
   }
   assert(ncomponents > 0); /* otherwise instance is linear */

   /*
   for( i = 0; i < gmoN(gmo); ++i )
      printf("variable %d component %d\n", i, component[i]);
   for( i = 0; i < ncomponents; ++i )
      printf("component %d size: %d\n", i, componentsize[i]);
   */

   free(colidx);
   free(rowidx);
   free(rowstart);
   free(component);
   free(componentsize);

   /* qsort(componentsize, ncomponents, sizeof(int), intdiff); */

   printf("NLAGHESSIANBLOCKS = %d\n", ncomponents);
   printf("LAGHESSIANMINBLOCKSIZE = %d\n", minsize);
   printf("LAGHESSIANMAXBLOCKSIZE = %d\n", maxsize);
   printf("LAGHESSIANAVGBLOCKSIZE = %f\n", (double)sumsize / ncomponents);

   return RETURN_OK;
}


static
RETURN instanceCheck(
   gmoHandle_t gmo,
   gevHandle_t gev,
   const char* gmsfile
   )
{
   int numsos1;
   int numsos2;
   int nzsos;
   int len;
   int c;
   int e;
   int i;
   
   double* objcoefs = NULL;
   int* objnlflags = NULL;
   int nnlbin;
   int nnlint;
   int nnlsemi;
   int nbounded;
   int nhalfbounded;

   int do2dir;
   int dohess;

   int maxqnz;
   int qnz;
   int* qcol = NULL;
   int* qrow = NULL;
   double* qcoef = NULL;

   CURVATURE curv;
   CURVATURE curvconss;
   FUNCTYPE functype;
   int typecnt[FUNCTYPE_NONLINEAR+1];
   int nconvexcons;
   int nconcavecons;
   int nindefinitecons;
   int ndiagquadcons;

   char sparsityfile[GMS_SSSIZE + 10];

   assert(gmo != NULL);
   assert(gev != NULL);
   assert(gmsfile != NULL);

   if( gmoGetEquTypeCnt(gmo, gmoequ_X) > 0 )
      fputs("External equations not supported.\n", stderr);
   if( gmoGetEquTypeCnt(gmo, gmoequ_C) > 0 )
      fputs("Conic equations not supported.\n", stderr);

   if( gmoObjNLNZ(gmo) > 0 )
   {
      objcoefs = (double*) malloc(gmoN(gmo) * sizeof(double));
      objnlflags = (int*) malloc(gmoN(gmo) * sizeof(int));
      gmoGetObjVector(gmo, objcoefs, objnlflags);
   }

   gmoUseQSet(gmo, 1);
   
   /* check how many discrete variables are nonlinear
    * count variable bounds
    */
   nnlbin = 0;
   nnlint = 0;
   nnlsemi = 0;
   nbounded = 0;
   nhalfbounded = 0;
   for( i = 0; i < gmoN(gmo); ++i )
   {
      int nz, nlnz, objnz;
      int haslb, hasub;
      gmoGetColStat(gmo, i, &nz, &qnz, &nlnz, &objnz); /* check whether nonlinear in constraints */
      if( qnz == 0 && nlnz == 0 && (objnlflags == NULL || objnlflags[i] == 0) )
         continue;
      
      switch( gmoGetVarTypeOne(gmo, i) )
      {
         case gmovar_B :
            ++nnlbin;
            break;
         case gmovar_I :
            ++nnlint;
            break;
         case gmovar_SC :
            ++nnlsemi;
            break;
         case gmovar_SI :
            ++nnlsemi;
            ++nnlint;
            break;
      }

      haslb = (gmoGetVarLowerOne(gmo, i) != gmoMinf(gmo));
      hasub = (gmoGetVarUpperOne(gmo, i) != gmoPinf(gmo));
      if( haslb && hasub )
         ++nbounded;
      else if( haslb || hasub )
         ++nhalfbounded;
   }

   printf("NVARS             = %d\n", gmoN(gmo));
   printf("NCONS             = %d\n", gmoM(gmo));
   printf("NBINVARS          = %d\n", gmoGetVarTypeCnt(gmo, gmovar_B));
   printf("NINTVARS          = %d\n", gmoGetVarTypeCnt(gmo, gmovar_I) + gmoGetVarTypeCnt(gmo, gmovar_SI));
   printf("NSEMI             = %d\n", gmoGetVarTypeCnt(gmo, gmovar_SC) + gmoGetVarTypeCnt(gmo, gmovar_SI));
   printf("NNLVARS           = %d\n", gmoNLN(gmo));
   printf("NNLBINVARS        = %d\n", nnlbin);
   printf("NNLINTVARS        = %d\n", nnlint);
   printf("NNLSEMI           = %d\n", nnlsemi);
   printf("NBOUNDEDVARS      = %d\n", nbounded);
   printf("NSINGLEBOUNDEDVARS = %d\n", nhalfbounded);

   gmoGetSosCounts(gmo, &numsos1, &numsos2, &nzsos);
   printf("NSOS1             = %d\n", numsos1);
   printf("NSOS2             = %d\n", numsos2);

   if( gmoModelType(gmo) != gmoProc_cns )
   {
      printf("OBJSENSE          = %s\n", gmoSense(gmo) == gmoObj_Min ? "min" : "max");
      printf("NOBJNZ            = %d\n", gmoObjNZ(gmo));
      printf("NOBJNLNZ          = %d\n", gmoObjNLNZ(gmo));
   }
   else
   {
      printf("NOBJNZ            = 0\n");
      printf("NOBJNLNZ          = 0\n");
   }
   printf("NJACOBIANNZ       = %d\n", gmoNZ(gmo));
   printf("NJACOBIANNLNZ     = %d\n", gmoNLNZ(gmo));

   do2dir = 0; /* don't need directional Hessian derivatives */
   dohess = 1; /* want full Hessians */
   gmoHessLoad(gmo, 0, &do2dir, &dohess);

   if( !dohess )
   {
      fprintf(stderr, "gmoHessLoad did not succeed\n");
   }
   else
   {
      printf("NLAGHESSIANNZ     = %d\n", 2 * gmoHessLagNz(gmo) - gmoHessLagDiagNz(gmo));
      printf("NLAGHESSIANDIAGNZ = %d\n", gmoHessLagDiagNz(gmo));
   }

   maxqnz = gmoMaxQNZ(gmo);
   if( maxqnz > 0 )
   {
      qcol = (int*) malloc(maxqnz * sizeof(int));
      qrow = (int*) malloc(maxqnz * sizeof(int));
      qcoef = (double*) malloc(maxqnz * sizeof(double));
   }

   for( e = FUNCTYPE_CONSTANT; e <= FUNCTYPE_NONLINEAR; ++e )
      typecnt[e] = 0;
   curvconss = CURVATURE_LINEAR;

   nconvexcons = 0;
   nconcavecons = 0;
   nindefinitecons = 0;
   ndiagquadcons = 0;
   for( c = -1; c < gmoM(gmo); ++c )
   {
      switch( c == -1 ? gmoGetObjOrder(gmo) : gmoGetEquOrderOne(gmo, c) )
      {
         case gmoorder_L :
            curv = CURVATURE_LINEAR;
            /* cannot easily check for #nonzeros in a single row, but constant equations are usually filtered out by GAMS anyway */
            functype = (c >= 0 || gmoObjNZ(gmo) > 0) ? FUNCTYPE_LINEAR : FUNCTYPE_CONSTANT;

            if( c == -1 )
            {
                printf("NOBJQUADNZ        = 0");
                printf("NOBJQUADDIAGNZ    = 0");
            }
            break;

         case gmoorder_Q :
         {
            if( c == -1 )
            {
               qnz = gmoObjQNZ(gmo);
               assert(qnz <= maxqnz);
               (void) gmoGetObjQ(gmo, qcol, qrow, qcoef);

               int diagnz = 0;
               for( i = 0; i < qnz; ++i )
                  if( qcol[i] == qrow[i] )
                     ++diagnz;
               printf("NOBJQUADNZ        = %d", qnz);
               printf("NOBJQUADDIAGNZ    = %d", diagnz);
            }
            else
            {
               qnz = gmoGetRowQNZOne(gmo, c);
               assert(qnz <= maxqnz);
               (void) gmoGetRowQ(gmo, c, qcol, qrow, qcoef);

               /* check if diagonal */
               for( i = 0; i < qnz && qcol[i] != qrow[i]; ++i );
               if( i == qnz )
                  ++ndiagquadcons;
            }

            CHECK( curvQuad(gmo, qnz, qcol, qrow, qcoef, &curv) );

            functype = FUNCTYPE_QUADRATIC;

            break;
         }

         case gmoorder_NL :
         default :
            fprintf(stderr, "Unexpected objective order %d\n", gmoGetObjOrder(gmo));
            return RETURN_ERROR;
      }

      if( c == -1 )
      {
         printf("OBJTYPE           = %s\n", functypename[functype]);
         printf("OBJCURVATURE      = %s\n", curvname[curv]);
      }
      else
      {
         /* adjust curvature to equation type */
         switch( gmoGetEquTypeOne(gmo, c) )
         {
            case gmoequ_E :
               curvAugment(&curv, curvNegate(curv));
               break;
            case gmoequ_G :
               curv = curvNegate(curv);
               break;
         }

         switch( curv )
         {
            case CURVATURE_CONVEX :
               ++nconvexcons;
               break;
            case CURVATURE_CONCAVE :
               ++nconcavecons;
               break;
            case CURVATURE_INDEFINITE:
               ++nindefinitecons;
               break;
            default: ;
         }

         curvAugment(&curvconss, curv);

         ++typecnt[functype];
      }
   }
   printf("CONSCURVATURE     = %s\n", curvname[curvconss]);
   printf("NCONVEXNLCONS     = %d\n", nconvexcons);
   printf("NCONCAVENLCONS    = %d\n", nconcavecons);
   printf("NINDEFINITENLCONS = %d\n", nindefinitecons);
   printf("NLINCONS          = %d\n", typecnt[FUNCTYPE_CONSTANT] + typecnt[FUNCTYPE_LINEAR]);
   printf("NQUADCONS         = %d\n", typecnt[FUNCTYPE_QUADRATIC]);
   printf("NDIAGQUADCONS     = %d\n", ndiagquadcons);

   free(objcoefs);
   free(objnlflags);
   free(qcol);
   free(qrow);
   free(qcoef);

   /* disable Q for simpler Examiner interface */
   gmoUseQSet(gmo, 0);

   /* sparsity of jacobian and lagrangian hessian */
   strncpy(sparsityfile, basename((char*)gmsfile), sizeof(sparsityfile)-8);
   if( (len = strlen(sparsityfile)) >= 4 && strcmp(sparsityfile + (len-4), ".gms") == 0 )
      sparsityfile[len-=4] = '\0';
   /*
   strcat(sparsityfile, ".jac.ppm");
   CHECK( plotSparsityJacobianPPM(gmo, gev, sparsityfile) );
   sparsityfile[len] = '\0';
   */
   strcat(sparsityfile, ".jac.png");
   CHECK( plotSparsityJacobianPNG(gmo, gev, sparsityfile) );
   sparsityfile[len] = '\0';

   /*
   strcat(sparsityfile, ".hess.pbm");
   CHECK( plotSparsityHessianPBM(gmo, gev, sparsityfile) );
   sparsityfile[len] = '\0';
   */
   strcat(sparsityfile, ".hess.png");
   CHECK( plotSparsityHessianPNG(gmo, gev, sparsityfile) );

   analyzeHessianBlocks(gmo, gev);

   return RETURN_OK;
}


int main(
   int argc,
   char** argv
   )
{
   gmoHandle_t gmo;
   gevHandle_t gev;

   if( argc < 2 )
   {
      printf("usage: %s <instance.gms> { <point.gdx> }\n", argv[0]);
      return 1;
   }
   
   CHECK( loadGMS(&gmo, &gev, argv[1]) );
   
   if( getenv("PROPCHECK_SKIPINSTANCE") == NULL )
   {
      CHECK( instanceCheck(gmo, gev, argv[1]) );
   }

   freeGMS(&gmo, &gev);
   
   return 0;
}
