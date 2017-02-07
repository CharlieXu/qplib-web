#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <assert.h>
#include <math.h>
#include <float.h>  /* for DBL_MAX */

#include "convert.h"

#include "gmomcc.h"
#include "gevmcc.h"

#if (GMOAPIVERSION >= 13) && (GMOAPIVERSION < 15)  /* or 14? */
#define gmoNameInput gmoNameOutput
#endif

#define MAX_PRINTLEN 561
#define PRINTLEN     100

const char* VARNAMEPREFIX[7] = { "x", "b", "i", "s1s", "s2s", "sc", "si" };

void convertEndLine(
   FILE*       file,
   char*       linebuffer,
   int*        linecnt
)
{
   fputs(linebuffer, file);
   fputs("\n", file);

   *linebuffer = '\0';
   *linecnt = 0;
}

void convertAppendLine(
   FILE*       file,
   char*       linebuffer,
   int*        linecnt,
   const char* extension
)
{
   int len;

   len = strlen(extension);
   assert(len < MAX_PRINTLEN);

   if( *linecnt + len >= MAX_PRINTLEN )
      convertEndLine(file, linebuffer, linecnt);

   assert(strlen(linebuffer) + len < MAX_PRINTLEN);
   strcat(linebuffer, extension);

   *linecnt += len;

   if( *linecnt > PRINTLEN )
   {
      convertEndLine(file, linebuffer, linecnt);
      convertAppendLine(file, linebuffer, linecnt, "  ");
   }
}

void convertGetVarName(
   gmoHandle_t gmo,
   int         idx,
   char*       buffer
   )
{
   /* if original model was a scalar model written by convert, we would like to keep original variable names,
    * even though we removed the objective variable
    */
   if( idx == gmoObjVar(gmo) )
      sprintf(buffer, "objvar");
   else
      sprintf(buffer, "%s%d", VARNAMEPREFIX[gmoGetVarTypeOne(gmo, idx)], gmoGetjModel(gmo, idx) + 1);
}

void convertGetEquName(
   gmoHandle_t gmo,
   int         idx,
   char*       buffer
   )
{
   /* if original model was a scalar model written by convert, we would like to keep original equation names,
    * even though we removed the objective equation
    */
   sprintf(buffer, "e%d", gmoGetiModel(gmo, idx) + 1);
}

static
RETURN writeStatistics(
   gmoHandle_t gmo,
   FILE*       file,
   char*       linebuffer,
   int*        linecnt,
   const char* comment  /**< comment marker to put at begin of line */
)
{
   char buffer[PRINTLEN];

   convertAppendLine(file, linebuffer, linecnt, comment);
   convertAppendLine(file, linebuffer, linecnt, "Equation counts");
   convertEndLine(file, linebuffer, linecnt);

   convertAppendLine(file, linebuffer, linecnt, comment);
   convertAppendLine(file, linebuffer, linecnt, "    Total        E        G        L        N        X        C        B");
   convertEndLine(file, linebuffer, linecnt);

   sprintf(buffer, "%s%9d%9d%9d%9d%9d%9d%9d%9d",
      comment,
      gmoM(gmo),
      gmoGetEquTypeCnt(gmo, gmoequ_E),
      gmoGetEquTypeCnt(gmo, gmoequ_G),
      gmoGetEquTypeCnt(gmo, gmoequ_L),
      gmoGetEquTypeCnt(gmo, gmoequ_N),
      gmoGetEquTypeCnt(gmo, gmoequ_X),
      gmoGetEquTypeCnt(gmo, gmoequ_C),
      gmoGetEquTypeCnt(gmo, gmoequ_B));
   convertAppendLine(file, linebuffer, linecnt, buffer);
   convertEndLine(file, linebuffer, linecnt);

   convertAppendLine(file, linebuffer, linecnt, comment);
   convertEndLine(file, linebuffer, linecnt);

   convertAppendLine(file, linebuffer, linecnt, comment);
   convertAppendLine(file, linebuffer, linecnt, "Variable counts");
   convertEndLine(file, linebuffer, linecnt);

   convertAppendLine(file, linebuffer, linecnt, comment);
   convertAppendLine(file, linebuffer, linecnt, "                 x        b        i      s1s      s2s       sc       si");
   convertEndLine(file, linebuffer, linecnt);

   convertAppendLine(file, linebuffer, linecnt, comment);
   convertAppendLine(file, linebuffer, linecnt, "    Total     cont   binary  integer     sos1     sos2    scont     sint");
   convertEndLine(file, linebuffer, linecnt);

   sprintf(buffer, "%s%9d%9d%9d%9d%9d%9d%9d%9d",
      comment,
      gmoN(gmo),
      gmoGetVarTypeCnt(gmo, gmovar_X),
      gmoGetVarTypeCnt(gmo, gmovar_B),
      gmoGetVarTypeCnt(gmo, gmovar_I),
      gmoGetVarTypeCnt(gmo, gmovar_S1),
      gmoGetVarTypeCnt(gmo, gmovar_S2),
      gmoGetVarTypeCnt(gmo, gmovar_SC),
      gmoGetVarTypeCnt(gmo, gmovar_SI));
   convertAppendLine(file, linebuffer, linecnt, buffer);
   convertEndLine(file, linebuffer, linecnt);

   convertAppendLine(file, linebuffer, linecnt, comment);
   convertEndLine(file, linebuffer, linecnt);

   convertAppendLine(file, linebuffer, linecnt, comment);
   convertAppendLine(file, linebuffer, linecnt, "Nonzero counts");
   convertEndLine(file, linebuffer, linecnt);

   convertAppendLine(file, linebuffer, linecnt, comment);
   convertAppendLine(file, linebuffer, linecnt, "    Total    const       NL      DLL");
   convertEndLine(file, linebuffer, linecnt);

   sprintf(buffer, "%s%9d%9d%9d%9d",
      comment,
      gmoNZ(gmo) + (gmoObjStyle(gmo) == gmoObjType_Var ? 1 : gmoObjNZ(gmo)),
      gmoNZ(gmo) - gmoNLNZ(gmo) + (gmoObjStyle(gmo) == gmoObjType_Var ? 1 : gmoObjNZ(gmo) - gmoObjNLNZ(gmo)),
      gmoNLNZ(gmo) + (gmoObjStyle(gmo) == gmoObjType_Var ? 0 : gmoObjNLNZ(gmo)),
      0);
   convertAppendLine(file, linebuffer, linecnt, buffer);
   convertEndLine(file, linebuffer, linecnt);

   convertAppendLine(file, linebuffer, linecnt, comment);
   convertEndLine(file, linebuffer, linecnt);

   return RETURN_OK;
}

static
void writeBounds(
   gmoHandle_t gmo,
   FILE*       file,
   char*       linebuffer,
   int*        linecnt,
   int         doobjconstant
   )
{
   char buffer[PRINTLEN];
   int i;
   int printedsecname = 0;

   for( i = 0; i < gmoN(gmo); ++i )
   {
      double lb, ub;
      double defub;

      lb = gmoGetVarLowerOne(gmo, i);
      ub = gmoGetVarUpperOne(gmo, i);
      defub = (gmoGetVarTypeOne(gmo, i) == gmovar_B) ? 1.0 : gmoPinf(gmo);

      if( lb == 0.0 && ub == defub )  /* default .lp bounds -> skip */
         continue;

      if( !printedsecname )
      {
         convertAppendLine(file, linebuffer, linecnt, "Bounds");
         convertEndLine(file, linebuffer, linecnt);
         printedsecname = 1;
      }

      convertAppendLine(file, linebuffer, linecnt, " ");

      if( lb == gmoMinf(gmo) && ub == gmoPinf(gmo) )
      {
         convertGetVarName(gmo, i, buffer);
         convertAppendLine(file, linebuffer, linecnt, buffer);
         convertAppendLine(file, linebuffer, linecnt, " Free");
         convertEndLine(file, linebuffer, linecnt);

         continue;
      }

      if( lb != 0.0 && lb != ub )
      {
         if( lb == gmoMinf(gmo) )
            strcpy(buffer, "-inf");
         else
            sprintf(buffer, CONVERT_DOUBLEFORMAT, lb);
         convertAppendLine(file, linebuffer, linecnt, buffer);
         convertAppendLine(file, linebuffer, linecnt, " <= ");
      }

      convertGetVarName(gmo, i, buffer);
      convertAppendLine(file, linebuffer, linecnt, buffer);

      if( ub != defub || lb == ub )
      {
         if( lb != ub )
            convertAppendLine(file, linebuffer, linecnt, " <= ");
         else
            convertAppendLine(file, linebuffer, linecnt, " = ");
         if( ub == gmoPinf(gmo) )
            sprintf(buffer, "+inf");  /* this could only happen for a binary variable with upper bound +inf... very unlikely */
         else
            sprintf(buffer, CONVERT_DOUBLEFORMAT, ub);
         convertAppendLine(file, linebuffer, linecnt, buffer);
      }

      convertEndLine(file, linebuffer, linecnt);
   }

   if( doobjconstant && gmoObjConst(gmo) != 0.0 )
   {
      if( !printedsecname )
      {
         convertAppendLine(file, linebuffer, linecnt, "Bounds");
         convertEndLine(file, linebuffer, linecnt);
         printedsecname = 1;
      }
      sprintf(buffer, " objconstant = " CONVERT_DOUBLEFORMAT, gmoObjConst(gmo));
      convertAppendLine(file, linebuffer, linecnt, buffer);
      convertEndLine(file, linebuffer, linecnt);
   }

   if( printedsecname )
      convertEndLine(file, linebuffer, linecnt);
}

static
void writeVartypes(
   gmoHandle_t gmo,
   FILE*       file,
   char*       linebuffer,
   int*        linecnt
   )
{
   char buffer[PRINTLEN];
   int i;
   int printedsecname;

   if( gmoGetVarTypeCnt(gmo, gmovar_B) )
   {
      printedsecname = 0;
      for( i = 0; i < gmoN(gmo); ++i )
      {
         if( gmoGetVarTypeOne(gmo, i) != gmovar_B )
            continue;

         if( !printedsecname )
         {
            convertAppendLine(file, linebuffer, linecnt, "Binary");
            convertEndLine(file, linebuffer, linecnt);
            printedsecname = 1;
         }

         buffer[0] = ' ';
         convertGetVarName(gmo, i, buffer+1);
         convertAppendLine(file, linebuffer, linecnt, buffer);

         if( *linecnt > PRINTLEN - 10 )
            convertEndLine(file, linebuffer, linecnt);
      }
      if( printedsecname )
      {
         convertEndLine(file, linebuffer, linecnt);
         convertEndLine(file, linebuffer, linecnt);
      }
   }

   if( gmoGetVarTypeCnt(gmo, gmovar_I) || gmoGetVarTypeCnt(gmo, gmovar_SI) )
   {
      printedsecname = 0;
      for( i = 0; i < gmoN(gmo); ++i )
      {
         if( gmoGetVarTypeOne(gmo, i) != gmovar_I && gmoGetVarTypeOne(gmo, i) != gmovar_SI )
            continue;

         if( !printedsecname )
         {
            convertAppendLine(file, linebuffer, linecnt, "General");
            convertEndLine(file, linebuffer, linecnt);
            printedsecname = 1;
         }

         buffer[0] = ' ';
         convertGetVarName(gmo, i, buffer+1);
         convertAppendLine(file, linebuffer, linecnt, buffer);

         if( *linecnt > PRINTLEN - 10 )
            convertEndLine(file, linebuffer, linecnt);
      }
      if( printedsecname )
      {
         convertEndLine(file, linebuffer, linecnt);
         convertEndLine(file, linebuffer, linecnt);
      }
   }

   if( gmoGetVarTypeCnt(gmo, gmovar_SC) || gmoGetVarTypeCnt(gmo, gmovar_SI) )
   {
      printedsecname = 0;
      for( i = 0; i < gmoN(gmo); ++i )
      {
         if( gmoGetVarTypeOne(gmo, i) != gmovar_SC && gmoGetVarTypeOne(gmo, i) != gmovar_SI )
            continue;

         if( !printedsecname )
         {
            convertAppendLine(file, linebuffer, linecnt, "Semi");
            convertEndLine(file, linebuffer, linecnt);
            printedsecname = 1;
         }

         buffer[0] = ' ';
         convertGetVarName(gmo, i, buffer+1);
         convertAppendLine(file, linebuffer, linecnt, buffer);

         if( *linecnt > PRINTLEN - 10 )
            convertEndLine(file, linebuffer, linecnt);
      }
      if( printedsecname )
      {
         convertEndLine(file, linebuffer, linecnt);
         convertEndLine(file, linebuffer, linecnt);
      }
   }

   if( gmoGetVarTypeCnt(gmo, gmovar_S1) || gmoGetVarTypeCnt(gmo, gmovar_S2) )
   {
      int nsos1;
      int nsos2;
      int nsos;
      int nz;

      int* sostype;
      int* sosbeg;
      int* sosidx;
      double* soswt;
      int j;

      gmoGetSosCounts(gmo, &nsos1, &nsos2, &nz);
      nsos = nsos1 + nsos2;

      sostype = (int*) malloc(nsos * sizeof(int));
      sosbeg = (int*) malloc((nsos+1) * sizeof(int));
      sosidx = (int*) malloc(nz * sizeof(int));
      soswt = (double*) malloc(nz * sizeof(double));

      gmoGetSosConstraints(gmo, sostype, sosbeg, sosidx, soswt);

      convertAppendLine(file, linebuffer, linecnt, "SOS");
      convertEndLine(file, linebuffer, linecnt);

      for( i = 0; i < nsos; ++i )
      {
         sprintf(buffer, " set%03d: S%d::", i, sostype[i]);
         convertAppendLine(file, linebuffer, linecnt, buffer);

         for( j = sosbeg[i]; j < sosbeg[i+1]; ++j )
         {
            buffer[0] = ' ';
            convertGetVarName(gmo, sosidx[j], buffer+1);
            sprintf(buffer + strlen(buffer), ":" CONVERT_DOUBLEFORMAT, soswt[j]);
            convertAppendLine(file, linebuffer, linecnt, buffer);
         }

         convertEndLine(file, linebuffer, linecnt);
      }

      convertEndLine(file, linebuffer, linecnt);
   }
}


static
void writeLPFunction(
   gmoHandle_t gmo,
   FILE*       file,
   char*       linebuffer,
   int*        linecnt,
   int*        lincolidx,
   double*     lincoef,
   int         linnz,
   int*        quadcolidx,
   int*        quadrowidx,
   double*     quadcoef,
   int         quadnz
   )
{
   char buffer[PRINTLEN];
   int i;

   for( i = 0; i < linnz; ++i )
   {
      buffer[0] = '\0';

      if( lincoef[i] < 0.0 )
         strcat(buffer, "- ");
      else if( i > 0 )
         strcat(buffer, "+ ");

      if( fabs(lincoef[i]) != 1.0 )
         sprintf(buffer + strlen(buffer), CONVERT_DOUBLEFORMAT " ", fabs(lincoef[i]));

      convertGetVarName(gmo, lincolidx[i], buffer + strlen(buffer));

      if( i+1 < linnz )
         strcat(buffer, " ");

      convertAppendLine(file, linebuffer, linecnt, buffer);
   }

   if( quadnz == 0 )
      return;

   if( linnz > 0 )
      convertAppendLine(file, linebuffer, linecnt, " + ");

   convertAppendLine(file, linebuffer, linecnt, "[ ");

   for( i = 0; i < quadnz; ++i )
   {
      buffer[0] = '\0';

      /* because GMO is stupid */
      if( quadcolidx[i] == quadrowidx[i] )
         quadcoef[i] /= 2.0;

      if( quadcoef[i] < 0.0 )
         strcat(buffer, "- ");
      else if( i > 0 )
         strcat(buffer, "+ ");

      if( fabs(quadcoef[i]) != 1.0 )
         sprintf(buffer + strlen(buffer), CONVERT_DOUBLEFORMAT " ", fabs(quadcoef[i]));

      convertGetVarName(gmo, quadcolidx[i], buffer + strlen(buffer));
      if( quadcolidx[i] == quadrowidx[i] )
      {
         strcat(buffer, "^2");
      }
      else
      {
         strcat(buffer, " * ");
         convertGetVarName(gmo, quadrowidx[i], buffer + strlen(buffer));
      }
      strcat(buffer, " ");

      convertAppendLine(file, linebuffer, linecnt, buffer);
   }

   convertAppendLine(file, linebuffer, linecnt, "]");
}




RETURN writeLP(
   gmoHandle_t gmo,
   gevHandle_t gev,
   const char* filename
)
{
   char linebuffer[MAX_PRINTLEN];
   int  linecnt;
   FILE* f;
   char buffer[GMS_SSSIZE+10];

   int* lincolidx;
   double* lincoef;
   int linnz;

   int* quadrowidx;
   int* quadcolidx;
   double* quadcoef;
   int quadnz;

   int nlnz;
   int i;

   assert(gmo != NULL);
   assert(gev != NULL);
   assert(filename != NULL);

   gmoUseQSet(gmo, 1);

   if( (gmoObjStyle(gmo) == gmoObjType_Fun && gmoGetObjOrder(gmo) == gmoorder_NL) || gmoNLM(gmo) > 0 )
   {
      fputs("Instance has general nonlinear equations, cannot write in .lp format.\n", stderr);
      return RETURN_ERROR;
   }

   if( gmoGetEquTypeCnt(gmo, gmoequ_C) )
   {
      /* TODO we could reformulate as quadratic */
      fputs("Instance has conic equations, cannot write in .lp format.\n", stderr);
      return RETURN_ERROR;
   }

   f = fopen(filename, "w");
   if( f == NULL )
   {
      fprintf(stderr, "Could not open file %s for writing.\n", filename);
      return RETURN_ERROR;
   }

   linebuffer[0] = '\0';
   linecnt = 0;

   CHECK( writeStatistics(gmo, f, linebuffer, &linecnt, "\\ ") );

   lincolidx = (int*) malloc(gmoN(gmo) * sizeof(int));
   lincoef   = (double*) malloc(gmoN(gmo) * sizeof(double));
   quadrowidx = (int*) malloc(gmoMaxQNZ(gmo) * sizeof(int));
   quadcolidx = (int*) malloc(gmoMaxQNZ(gmo) * sizeof(int));
   quadcoef   = (double*) malloc(gmoMaxQNZ(gmo) * sizeof(double));

   if( gmoSense(gmo) == gmoObj_Min )
      convertAppendLine(f, linebuffer, &linecnt, "Minimize");
   else
      convertAppendLine(f, linebuffer, &linecnt, "Maximize");
   convertEndLine(f, linebuffer, &linecnt);

   convertAppendLine(f, linebuffer, &linecnt, " obj: ");

   for( i = 0; i < gmoN(gmo); ++i )
      lincolidx[i] = i;
   linnz = gmoN(gmo);

   quadnz = 0;
   if( gmoObjStyle(gmo) == gmoObjType_Var )
   {
      memset(lincoef, 0, gmoN(gmo) * sizeof(double));
      if( gmoObjVar(gmo) != gmoValNAInt(gmo) )
         lincoef[gmoObjVar(gmo)] = 1.0;
   }
   else
   {
      gmoGetObjVector(gmo, lincoef, NULL);

      /* gmoGetObjSparse(gmo, lincolidx, lincoef, NULL, &linnz, &nlnz); */

      if( gmoGetObjOrder(gmo) == gmoorder_Q )
      {
         quadnz = gmoObjQNZ(gmo);
         assert(quadnz <= gmoMaxQNZ(gmo));
         gmoGetObjQ(gmo, quadcolidx, quadrowidx, quadcoef);
         for( i = 0; i < quadnz; ++i )
            quadcoef[i] *= 2.0;
      }
   }

   writeLPFunction(gmo, f, linebuffer, &linecnt,
      lincolidx, lincoef, linnz,
      quadcolidx, quadrowidx, quadcoef, quadnz);
   if( quadnz > 0 )
      convertAppendLine(f, linebuffer, &linecnt, "/2");

   if( gmoObjConst(gmo) != 0.0 )
      convertAppendLine(f, linebuffer, &linecnt, " + objconstant");

   convertEndLine(f, linebuffer, &linecnt);

   convertEndLine(f, linebuffer, &linecnt);

   convertAppendLine(f, linebuffer, &linecnt, "Subject To");
   convertEndLine(f, linebuffer, &linecnt);

   for( i = 0; i < gmoM(gmo); ++i )
   {
      buffer[0] = ' ';
      convertGetEquName(gmo, i, buffer+1);
      strcat(buffer, ": ");
      convertAppendLine(f, linebuffer, &linecnt, buffer);

      gmoGetRowSparse(gmo, i, lincolidx, lincoef, NULL, &linnz, &nlnz);
      assert(nlnz == 0);

      quadnz = 0;
      if( gmoGetEquOrderOne(gmo, i) == gmoorder_Q )
      {
         quadnz = gmoGetRowQNZOne(gmo, i);
         assert(quadnz <= gmoMaxQNZ(gmo));
         gmoGetRowQ(gmo, i, quadcolidx, quadrowidx, quadcoef);
      }

      writeLPFunction(gmo, f, linebuffer, &linecnt,
         lincolidx, lincoef, linnz,
         quadcolidx, quadrowidx, quadcoef, quadnz);

      switch( gmoGetEquTypeOne(gmo, i) )
      {
         case gmoequ_E :
            convertAppendLine(f, linebuffer, &linecnt, " = ");
            break;
         case gmoequ_G :
            convertAppendLine(f, linebuffer, &linecnt, " >= ");
            break;
         case gmoequ_L :
            convertAppendLine(f, linebuffer, &linecnt, " <= ");
            break;
         default :
            /* should have been catched above */
            fputs("Unsupported equation type\n", stderr);
            return RETURN_ERROR;
      }

      sprintf(buffer, CONVERT_DOUBLEFORMAT, gmoGetRhsOne(gmo, i));
      convertAppendLine(f, linebuffer, &linecnt, buffer);

      convertEndLine(f, linebuffer, &linecnt);

   }
   convertEndLine(f, linebuffer, &linecnt);

   free(lincolidx);
   free(lincoef);
   free(quadrowidx);
   free(quadcolidx);
   free(quadcoef);

   writeBounds(gmo, f, linebuffer, &linecnt, 1);

   writeVartypes(gmo, f, linebuffer, &linecnt);

   convertAppendLine(f, linebuffer, &linecnt, "End");
   convertEndLine(f, linebuffer, &linecnt);


   fclose(f);

   return RETURN_OK;
}

static
int cmprdouble(
   const void* a,
   const void* b
   )
{
   return (double*)a < (double*)b;
}

static
double getMostCommonValue(
   double* x,
   int n
   )
{
   double* sorted;
   double bestval;
   int bestcount;
   double curval;
   int curcount;
   int i;

   if( n == 0 )
      return 0.0;

   sorted = (double*)malloc(n * sizeof(double));
   memcpy(sorted, x, n * sizeof(double));
   qsort(sorted, n, sizeof(double), cmprdouble);

   curval = sorted[0];
   curcount = 1;
   bestcount = 0;
   bestval = 0.0;
   for( i = 1; i < n; ++i )
   {
      if( sorted[i] == curval )
      {
         ++curcount;
         continue;
      }

      if( curcount > bestcount )
      {
         bestcount = curcount;
         bestval = curval;
      }

      curval = sorted[i];
      curcount = 1;
   }
   if( curcount > bestcount )
   {
      bestcount = curcount;
      bestval = curval;
   }

   free(sorted);

   return bestval;
}


static
int getNNondefaultEntries(
   double* x,
   int n,
   double def
   )
{
   int i;
   int cnt = 0;
   for( i = 0; i < n; ++i )
      if( x[i] != def )
         ++cnt;

   return cnt;
}

/* float format */
#define FF "%.15g"
static
const char* formatDouble(
   double d
)
{
   static char buf[50];
   if( d == (int)d )
      sprintf(buf, "%d.0", (int)d);
   else
      sprintf(buf, FF, d);
   return buf;
}

RETURN writeQPLIB(
   gmoHandle_t gmo,
   gevHandle_t gev,
   const char* filename
)
{
   char linebuffer[MAX_PRINTLEN];
   int  linecnt;

   FILE* f;
   char buffer[GMS_SSSIZE+10];

   int* lincolidx;
   double* lincoef;
   int linnz;

   int* quadrowidx;
   int* quadcolidx;
   double* quadcoef;
   int quadnz;

   int sumnz;
   double def;

   double* x;

   int nlnz;
   int i;
   int j;

   assert(gmo != NULL);
   assert(gev != NULL);
   assert(filename != NULL);

   gmoPinfSet(gmo,  DBL_MAX);
   gmoMinfSet(gmo, -DBL_MAX);

   gmoUseQSet(gmo, 1);

   if( (gmoObjStyle(gmo) == gmoObjType_Fun && gmoGetObjOrder(gmo) == gmoorder_NL) || gmoNLM(gmo) > 0 )
   {
      fputs("Instance has general nonlinear equations, cannot write in .qplib format.\n", stderr);
      return RETURN_ERROR;
   }

   if( gmoGetEquTypeCnt(gmo, gmoequ_C) )
   {
      /* TODO we could reformulate as quadratic */
      fputs("Instance has conic equations, cannot write in .qplib format.\n", stderr);
      return RETURN_ERROR;
   }

   f = fopen(filename, "w");
   if( f == NULL )
   {
      fprintf(stderr, "Could not open file %s for writing.\n", filename);
      return RETURN_ERROR;
   }

   linebuffer[0] = '\0';
   linecnt = 0;

   CHECK( writeStatistics(gmo, f, linebuffer, &linecnt, "# ") );

   lincolidx = (int*) malloc(gmoN(gmo) * sizeof(int));
   lincoef   = (double*) malloc(gmoN(gmo) * sizeof(double));
   quadrowidx = (int*) malloc(gmoMaxQNZ(gmo) * sizeof(int));
   quadcolidx = (int*) malloc(gmoMaxQNZ(gmo) * sizeof(int));
   quadcoef   = (double*) malloc(gmoMaxQNZ(gmo) * sizeof(double));
   x = (double*) malloc(MAX(gmoN(gmo),gmoM(gmo)) * sizeof(double));

   fputs(gmoNameInput(gmo, buffer), f);
   fputs("\n", f);

   /* objective classification */
   if( gmoObjQNZ(gmo) > 0 )
      fputs("Q", f);  /* quadratic objective - we are not going to check convexity here... */
   else
      fputs("L", f);

   /* variable classification */
   if( gmoNDisc(gmo) == gmoN(gmo) )
      fputs("I", f); /* binary and general integer only */
   else if( gmoNDisc(gmo) > 0 )
      fputs("G", f);  /* mixed integer and continuous */
   else
      fputs("C", f);  /* continuous only */
   /* QPLIB format also allows for binary variables, but in certain situation,
    * one may still have to specify bounds for them; for now, we just treat
    * binaries like general integers
    */

   /* constraints classification */
   if( gmoM(gmo) == 0 )
      fputs("B", f); /* no constraints other than bounds, possibly */
   else if( gmoNLM(gmo) == 0 )
      fputs("L", f); /* only linear constraints */
   else
      fputs("Q", f); /* quadratic constraints */
   fputs("\n", f);

   if( gmoSense(gmo) == gmoObj_Min )
      fputs("minimize\n", f);
   else
      fputs("maximize\n", f);

   fprintf(f, "%d\n", gmoN(gmo));
   if( gmoM(gmo) > 0 )  /* omit constraint number for BQP */
      fprintf(f, "%d\n", gmoM(gmo));

   quadnz = gmoObjQNZ(gmo);
   if( quadnz > 0 )
   {
      /* obj quad nz is omitted for Q** */
      gmoGetObjQ(gmo, quadcolidx, quadrowidx, quadcoef);

      fprintf(f, "%d\n", quadnz);
      for( i = 0; i < quadnz; ++i )
         fprintf(f, "%d %d %s\n", MAX(quadrowidx[i], quadcolidx[i]) + 1, MIN(quadrowidx[i], quadcolidx[i]) + 1, formatDouble((quadrowidx[i] == quadcolidx[i]) ? quadcoef[i] : 2.0*quadcoef[i]));
   }

   gmoGetObjVector(gmo, lincoef, NULL);
   linnz = 0;
   for( i = 0; i < gmoN(gmo); ++i )
      if( lincoef[i] != 0.0 )
         ++linnz;

   def = getMostCommonValue(lincoef, linnz);
   fprintf(f, "%s\n", formatDouble(def));
   fprintf(f, "%d\n", getNNondefaultEntries(lincoef, linnz, def));
   for( i = 0; i < linnz; ++i )
      if( lincoef[i] != def )
         fprintf(f, "%d %s\n", i+1, formatDouble(lincoef[i]));

   fprintf(f, "%s\n", formatDouble(gmoObjConst(gmo)));

   /* constraints quad coef matrices */
   if( gmoNLM(gmo) == 0 )
   {
      /* this section is omitted when no quadratic constraints (**B or **L) */

      sumnz = 0;
      for( i = 0; i < gmoM(gmo); ++i )
         if( gmoGetEquOrderOne(gmo, i) == gmoorder_Q )
            sumnz += gmoGetRowQNZOne(gmo, i);
      fprintf(f, "%d\n", sumnz);

      for( i = 0; i < gmoM(gmo); ++i )
      {
         quadnz = 0;
         if( gmoGetEquOrderOne(gmo, i) == gmoorder_Q )
         {
            quadnz = gmoGetRowQNZOne(gmo, i);
            assert(quadnz <= gmoMaxQNZ(gmo));
            gmoGetRowQ(gmo, i, quadcolidx, quadrowidx, quadcoef);
         }

         for( j = 0; j < quadnz; ++j )
            fprintf(f, "%d %d %d %s\n", i+1, MAX(quadrowidx[i], quadcolidx[i]) + 1, MIN(quadrowidx[i], quadcolidx[i]) + 1, formatDouble((quadrowidx[j] == quadcolidx[j]) ? quadcoef[j] : 2.0*quadcoef[j]));
      }
   }

   /* constraints linear coefs */
   sumnz = 0;
   for( i = 0; i < gmoM(gmo); ++i )
   {
      gmoGetRowSparse(gmo, i, lincolidx, lincoef, NULL, &linnz, &nlnz);
      sumnz += linnz;
   }
   if( gmoM(gmo) > 0 )
      fprintf(f, "%d\n", sumnz);

   for( i = 0; i < gmoM(gmo); ++i )
   {
      gmoGetRowSparse(gmo, i, lincolidx, lincoef, NULL, &linnz, &nlnz);

      for( j = 0; j < linnz; ++j )
         fprintf(f, "%d %d %s\n", i+1, lincolidx[j]+1, formatDouble(lincoef[j]));
   }

   fprintf(f, "%s\n", formatDouble(gmoPinf(gmo)));

   if( gmoM(gmo) > 0 )
   {
      /* left-hand side */

      /* assemble values in an array first */
      for( i = 0; i < gmoM(gmo); ++i )
         if( (gmoGetEquTypeOne(gmo, i) == gmoequ_G) || (gmoGetEquTypeOne(gmo, i) == gmoequ_E) )
            x[i] = gmoGetRhsOne(gmo, i);
         else
            x[i] = gmoMinf(gmo);

      def = getMostCommonValue(x, gmoM(gmo));
      fprintf(f, "%s\n", formatDouble(def)); /* default lhs */
      fprintf(f, "%d\n", getNNondefaultEntries(x, gmoM(gmo), def));
      for( i = 0; i < gmoM(gmo); ++i )
         if( x[i] != def )
            fprintf(f, "%d %s\n", i+1, formatDouble(x[i]));

      /* right-hand side */

      /* assemble values in an array first */
      for( i = 0; i < gmoM(gmo); ++i )
         if( (gmoGetEquTypeOne(gmo, i) == gmoequ_L) || (gmoGetEquTypeOne(gmo, i) == gmoequ_E) )
            x[i] = gmoGetRhsOne(gmo, i);
         else
            x[i] = gmoPinf(gmo);

      def = getMostCommonValue(x, gmoM(gmo));
      fprintf(f, "%s\n", formatDouble(def)); /* default rhs */
      fprintf(f, "%d\n", getNNondefaultEntries(x, gmoM(gmo), def));
      for( i = 0; i < gmoM(gmo); ++i )
         if( x[i] != def )
            fprintf(f, "%d %s\n", i+1, formatDouble(x[i]));
   }

   /* variable lower bounds */
   gmoGetVarLower(gmo, x);
   def = getMostCommonValue(x, gmoN(gmo));
   fprintf(f, "%s\n", formatDouble(def)); /* default lb */
   fprintf(f, "%d\n", getNNondefaultEntries(x, gmoN(gmo), def));
   for( i = 0; i < gmoN(gmo); ++i )
      if( x[i] != def )
         fprintf(f, "%d %s\n", i+1, formatDouble(x[i]));

   /* variable upper bounds */
   gmoGetVarUpper(gmo, x);
   def = getMostCommonValue(x, gmoN(gmo));
   fprintf(f, "%s\n", formatDouble(def)); /* default ub */
   fprintf(f, "%d\n", getNNondefaultEntries(x, gmoN(gmo), def));
   for( i = 0; i < gmoN(gmo); ++i )
      if( x[i] != def )
         fprintf(f, "%d %s\n", i+1, formatDouble(x[i]));

   /* variable types */
   if( gmoNDisc(gmo) > 0 && gmoNDisc(gmo) < gmoN(gmo) )
   {
      fputs("0\n", f);  /* default variable type is "continuous" */
      fprintf(f, "%d\n", gmoNDisc(gmo));
      for( i = 0; i < gmoN(gmo); ++i )
         if( x[i] != gmovar_X )
            fprintf(f, "%d 1\n", i+1);
   }

   /* starting point: variable values */
   gmoGetVarL(gmo, x);
   def = getMostCommonValue(x, gmoN(gmo));
   fprintf(f, "%s\n", formatDouble(def));  /* default value */
   fprintf(f, "%d\n", getNNondefaultEntries(x, gmoN(gmo), def));
   for( i = 0; i < gmoN(gmo); ++i )
      if( x[i] != def )
         fprintf(f, "%d %s\n", i+1, formatDouble(x[i]));

   /* starting point: equation marginals */
   if( gmoM(gmo) > 0 )
   {
      gmoGetEquM(gmo, x);
      def = getMostCommonValue(x, gmoM(gmo));
      fprintf(f, "%s\n", formatDouble(def));  /* default value */
      fprintf(f, "%d\n", getNNondefaultEntries(x, gmoM(gmo), def));
      for( i = 0; i < gmoM(gmo); ++i )
         if( x[i] != def )
            fprintf(f, "%d %s\n", i+1, formatDouble(x[i]));
   }

   /* starting point: variable marginals */
   gmoGetVarM(gmo, x);
   def = getMostCommonValue(x, gmoN(gmo));
   fprintf(f, "%s\n", formatDouble(def));  /* default value */
   fprintf(f, "%d\n", getNNondefaultEntries(x, gmoN(gmo), def));
   for( i = 0; i < gmoN(gmo); ++i )
      if( x[i] != def )
         fprintf(f, "%d %s\n", i+1, formatDouble(x[i]));

   fputs("0\n", f); /* no nondefault variable names (TODO?) */
   fputs("0\n", f); /* no nondefault equation names (TODO?) */

   fclose(f);

   free(lincolidx);
   free(lincoef);
   free(quadrowidx);
   free(quadcolidx);
   free(quadcoef);
   free(x);

   return RETURN_OK;
}
