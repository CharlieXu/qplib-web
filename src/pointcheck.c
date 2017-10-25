#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <assert.h>
#include <math.h>

#include "gmomcc.h"
#include "gevmcc.h"

#include "pointcheck.h"

#define LOGOUT 0

static
RETURN checkEquations(
   gmoHandle_t gmo,
   gevHandle_t gev,
   double*     infeasibility
   )
{
   int i;
   double activity;
   double rhs;
   double infeas;

   /* we assume that equation levels are uptodate */
   /* gmoCompleteSolution(gmo); */

   for( i = 0; i < gmoM(gmo); ++i )
   {
      activity = gmoGetEquLOne(gmo, i);
      rhs = gmoGetRhsOne(gmo, i);
      switch( gmoGetEquTypeOne(gmo, i) )
      {
         case gmoequ_B :
         case gmoequ_E :
            infeas = fabs(activity - rhs);
            break;
         case gmoequ_G : /* activity >= rhs */
            infeas = MAX(rhs - activity, 0.0);
            break;
         case gmoequ_L : /* activity <= rhs */
            infeas = MAX(activity - rhs, 0.0);
            break;
         case gmoequ_N :
            infeas = 0.0;
            break;
         default:
            fprintf(stderr, "Unsupported equation type %d for equation %d\n", gmoGetEquTypeOne(gmo, i), i);
            return RETURN_ERROR;
      }

#if LOGOUT
      if( infeas > 0.0 )
      {
         char buffer[GMS_SSSIZE];
         printf("Constraint %s violated by %g\n", gmoGetEquNameOne(gmo, i, buffer), infeas);
      }
#endif

      if( infeas > *infeasibility )
         *infeasibility = infeas;
   }

   return RETURN_OK;
}

static
RETURN checkSOS(
   gmoHandle_t gmo,
   gevHandle_t gev,
   double*     infeasibility
   )
{
   int* sosType;
   int* sosStart;
   int* sosColIdx;
   double* sosWeights;
   int nSOS1;
   int nSOS2;
   int nSOS;
   int nSOScols;
   int i;
   int s;

   double val;
   double max1;
   double max2;
   int max1idx;
   int max2idx;
   double infeas;
   double maxinfeas;

   assert(infeasibility != NULL);

   (void) gmoGetSosCounts(gmo, &nSOS1, &nSOS2, &nSOScols);
   if( nSOScols == 0 )
      return RETURN_OK;

   nSOS = nSOS1 + nSOS2;

   sosType = (int*) malloc(sizeof(int) * nSOS);
   sosStart = (int*) malloc(sizeof(int) * (nSOS+1));
   sosColIdx = (int*) malloc(sizeof(int) * nSOScols);
   sosWeights = (double*) malloc(sizeof(double) *gmoN(gmo));

   assert(sosType != NULL);
   assert(sosStart != NULL);
   assert(sosColIdx != NULL);
   assert(sosWeights != NULL);

   (void) gmoGetSosConstraints(gmo, sosType, sosStart, sosColIdx, sosWeights);

   maxinfeas = 0.0;
   for( s = 0; s < nSOS; ++s )
   {
      /* look for 2 maximal values */
      max1 = 0.0;
      max1idx = -1;
      max2 = 0.0;
      max2idx = -1;
      for( i = sosStart[s]; i < sosStart[s+1]; ++i )
      {
         val = gmoGetVarLOne(gmo, sosColIdx[i]);

         if( val >= max1 )
         {
            if( max1 > max2 )
            {
               max2 = max1;
               max2idx = max1idx;
            }
            max1 = val;
            max1idx = i;
         }
      }
      /* if SOS type 1, forget 2nd maximum */
      if( sosType[s] == 1 )
      {
         max2 = 0.0;
         max2idx = -1;
      }

      infeas = 0.0;
      /* printf("SOS %d type %d:", s, sosType[s]); */
      for( i = sosStart[s]; i < sosStart[s+1]; ++i )
      {
         val = gmoGetVarLOne(gmo, sosColIdx[i]);
         /* printf(" %g", val); */

         if( val < 0.0 )
            infeas += -val;

         if( val > 0.0 && i != max1idx && i != max2idx )
            infeas += val;
      }
      /* printf(" -> infeas %g\n", infeas); */

      if( infeas > maxinfeas )
         maxinfeas = infeas;
   }
#if LOGOUT
   printf("Violation of SOS constraints: %g\n", maxinfeas);
#endif

   *infeasibility = MAX(*infeasibility, maxinfeas);

   free(sosType);
   free(sosStart);
   free(sosColIdx);
   free(sosWeights);

   return RETURN_OK;
}

static
RETURN checkIntegrality(
   gmoHandle_t gmo,
   gevHandle_t gev,
   double*     infeasibility
   )
{
   double maxinfeas;
   double val;
   int i;

   if( gmoNDisc(gmo) == 0 )
      return RETURN_OK;

   maxinfeas = 0.0;
   for( i = 0; i < gmoN(gmo); ++i )
   {
      switch( gmoGetVarTypeOne(gmo, i) )
      {
         case gmovar_B :
         case gmovar_I :
         case gmovar_SI :
         {
            val = gmoGetVarLOne(gmo, i);
            if( val != round(val) )
               maxinfeas = MAX(maxinfeas, fabs(val - round(val)));
         }
      }
   }

#if LOGOUT
   printf("Violation of integrality: %g\n", maxinfeas);
#endif

   *infeasibility = MAX(*infeasibility, maxinfeas);

   return RETURN_OK;
}

static
RETURN checkSemi(
   gmoHandle_t gmo,
   gevHandle_t gev,
   double*     infeasibility
   )
{
   double maxinfeas;
   double val;
   int i;

   if( gmoGetVarTypeCnt(gmo, gmovar_SC) == 0 && gmoGetVarTypeCnt(gmo, gmovar_SI) == 0 )
      return RETURN_OK;

   maxinfeas = 0.0;
   for( i = 0; i < gmoN(gmo); ++i )
   {
      switch( gmoGetVarTypeOne(gmo, i) )
      {
         case gmovar_SI :
         case gmovar_SC :
         {
            val = gmoGetVarLOne(gmo, i);
            if( val < 0.0 )
               maxinfeas = MAX(maxinfeas, -val);
            else if( val > 0.0 && val < gmoGetVarLowerOne(gmo, i) )
               maxinfeas = MAX(maxinfeas, MIN(val, gmoGetVarLowerOne(gmo, i) - val));
         }
      }
   }

#if LOGOUT
   printf("Violation of semicontinuity/integrality: %g\n", maxinfeas);
#endif

   *infeasibility = MAX(*infeasibility, maxinfeas);

   return RETURN_OK;
}


extern
RETURN pointInfeasibility(
   gmoHandle_t gmo,
   gevHandle_t gev,
   double*     infeasibility
)
{
   switch( gmoModelType(gmo) )
   {
      case gmoProc_lp:
      case gmoProc_mip:
      case gmoProc_rmip:
      case gmoProc_nlp:
      case gmoProc_dnlp:
      case gmoProc_rminlp:
      case gmoProc_minlp:
      case gmoProc_qcp:
      case gmoProc_miqcp:
      case gmoProc_rmiqcp:
      case gmoProc_cns:
         break;
      case gmoProc_mcp:
      case gmoProc_emp:
      default:
         fprintf(stderr, "Model type not supported.");
         return RETURN_ERROR;
   }

   assert(infeasibility != NULL);
   *infeasibility = 0.0;

   CHECK( checkEquations(gmo, gev, infeasibility) );
   CHECK( checkSOS(gmo, gev, infeasibility) );
   CHECK( checkIntegrality(gmo, gev, infeasibility) );
   CHECK( checkSemi(gmo, gev, infeasibility) );

   return RETURN_OK;
}
