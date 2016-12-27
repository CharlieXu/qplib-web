#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <assert.h>

#include "gmomcc.h"
#include "gevmcc.h"

#include "curvcheck.h"

#if 0
# define F77_FUNC(name,NAME) NAME
# define F77_FUNC_(name,NAME) NAME
#else
# define F77_FUNC(name,NAME) name ## _
# define F77_FUNC_(name,NAME) name ## __
#endif

/** LAPACK Fortran subroutine DSYEV */
void F77_FUNC(dsyev,DSYEV)(char *jobz, char *uplo, int *n,
                          double *A, int *ldA, double *W,
                          double *WORK, int *LWORK, int *info,
                          int jobz_len, int uplo_len);

static
int IpLapackDsyev(int ndim, double *a,
                  int lda, double *w)
{
 int N=ndim, LDA=lda, info;

 char JOBZ = 'N';
 char UPLO = 'L';

 // First we find out how large LWORK should be
 int LWORK = -1;
 double WORK_PROBE;
 F77_FUNC(dsyev,DSYEV)(&JOBZ, &UPLO, &N, a, &LDA, w,
                       &WORK_PROBE, &LWORK, &info, 1, 1);

 LWORK = (int) WORK_PROBE;

 double* WORK = (double*) malloc(sizeof(double) * LWORK);
 for (int i=0; i<LWORK; i++) {
   WORK[i] = i;
 }
 F77_FUNC(dsyev,DSYEV)(&JOBZ, &UPLO, &N, a, &LDA, w,
                       WORK, &LWORK, &info, 1, 1);

 free(WORK);
 
 return info;
}

CURVATURE curvNegate(
   CURVATURE curv
   )
{
   switch( curv )
   {
      case CURVATURE_CONVEX:
         return CURVATURE_CONCAVE;
      case CURVATURE_CONCAVE:
         return CURVATURE_CONVEX;
      case CURVATURE_NONCONVEX :
         return CURVATURE_NONCONCAVE;
      case CURVATURE_NONCONCAVE :
         return CURVATURE_NONCONVEX;
      default:
         return curv;
   }
}

static
CURVATURE curvadd[8][8] =
{
/*                           CURVATURE_LINEAR     CURVATURE_INDEFINITE  CURVATURE_CONVEX      CURVATURE_NONCONCAVE, CURVATURE_CONCAVE     CURVATURE_NONCONVEX     CURVATURE_UNKNOWN   */
/* CURVATURE_LINEAR */     { CURVATURE_LINEAR    ,CURVATURE_INDEFINITE, CURVATURE_CONVEX    , CURVATURE_NONCONCAVE, CURVATURE_CONCAVE   , CURVATURE_NONCONVEX ,0, CURVATURE_UNKNOWN   },
/* CURVATURE_INDEFINITE */ { CURVATURE_INDEFINITE,CURVATURE_INDEFINITE, CURVATURE_INDEFINITE, CURVATURE_INDEFINITE, CURVATURE_INDEFINITE, CURVATURE_INDEFINITE,0, CURVATURE_INDEFINITE},
/* CURVATURE_CONVEX */     { CURVATURE_CONVEX    ,CURVATURE_INDEFINITE, CURVATURE_CONVEX    , CURVATURE_NONCONCAVE, CURVATURE_INDEFINITE, CURVATURE_INDEFINITE,0, CURVATURE_NONCONCAVE},
/* CURVATURE_NONCONCAVE */ { CURVATURE_NONCONCAVE,CURVATURE_INDEFINITE, CURVATURE_NONCONCAVE, CURVATURE_NONCONCAVE, CURVATURE_INDEFINITE, CURVATURE_INDEFINITE,0, CURVATURE_NONCONCAVE},
/* CURVATURE_CONCAVE */    { CURVATURE_CONCAVE   ,CURVATURE_INDEFINITE, CURVATURE_INDEFINITE, CURVATURE_INDEFINITE, CURVATURE_CONCAVE   , CURVATURE_NONCONVEX ,0, CURVATURE_NONCONVEX },
/* CURVATURE_NONCONVEX */  { CURVATURE_NONCONVEX ,CURVATURE_INDEFINITE, CURVATURE_INDEFINITE, CURVATURE_INDEFINITE, CURVATURE_NONCONVEX , CURVATURE_NONCONVEX ,0, CURVATURE_NONCONVEX },
{},
/* CURVATURE_UNKNOWN */    { CURVATURE_UNKNOWN   ,CURVATURE_INDEFINITE, CURVATURE_NONCONCAVE, CURVATURE_NONCONCAVE, CURVATURE_NONCONVEX , CURVATURE_NONCONVEX ,0, CURVATURE_UNKNOWN   },
};

void curvAugment(
   CURVATURE* curvconss,
   CURVATURE  curv
   )
{
   assert(curvconss != NULL);

   *curvconss = curvadd[*curvconss][curv];
}

RETURN curvQuad(
   gmoHandle_t gmo,
   int qnz,
   int* qcol,
   int* qrow,
   double* qcoef,
   CURVATURE* curv
   )
{
   int* varmap = NULL;
   double* a = NULL;
   int i;
   int dim;
   double* eigvals = NULL;
   int npos;
   int nneg;

   assert(qcol != NULL);
   assert(qrow != NULL);
   assert(qcoef != NULL);
   assert(curv != NULL);

   varmap = (int*)malloc(gmoN(gmo) * sizeof(int));
   for( i = 0; i < gmoN(gmo); ++i )
      varmap[i] = -1;

   *curv = CURVATURE_UNKNOWN;

   dim = 0;
   for( i = 0; i < qnz; ++i )
   {
      if( varmap[qcol[i]] == -1 )
         varmap[qcol[i]] = dim++;
      qcol[i] = varmap[qcol[i]];
      if( varmap[qrow[i]] == -1 )
         varmap[qrow[i]] = dim++;
      qrow[i] = varmap[qrow[i]];

      if( qcol[i] == qrow[i] )
      {
         /* quick check: positive (negative) elements on diagonal prohibit concavity (convexity, resp) */
         if( qcoef[i] > 1e-9 )
            curvAugment(curv, CURVATURE_NONCONCAVE);
         else if( qcoef[i] < -1e-9 )
            curvAugment(curv, CURVATURE_NONCONVEX);

         if( curvdecided[*curv] )
            goto TERMINATE;
      }
   }


   a = (double*)malloc(dim * dim * sizeof(double));
   if( a == NULL ) /* out of memory */
   {
      fputs("Out of memory in curvQuad\n", stderr);
      goto TERMINATE;
   }
   memset(a, 0, dim * dim * sizeof(double));

   eigvals = (double*)malloc(dim * sizeof(double));
   assert(eigvals != NULL);

   for( i = 0; i < qnz; ++i )
   {
      int row;
      int col;

      row = qrow[i];
      col = qcol[i];
      if( row < col )
         a[row * dim + col] = qcoef[i] / 2.0;
      else if ( row > col )
         a[col * dim + row] = qcoef[i] / 2.0;
      else
         a[row * dim + row] = qcoef[i];
   }

   IpLapackDsyev(dim, a, dim, eigvals);

   npos = 0;
   nneg = 0;
   for( i = 0; i < dim; ++i )
   {
      if( eigvals[i] < -1e-9 )
         ++nneg;
      else if( eigvals[i] > 1e-9 )
         ++npos;
   }

   if( npos && !nneg )
      *curv = CURVATURE_CONVEX;
   else if( !npos && nneg )
      *curv = CURVATURE_CONCAVE;
   else if( !npos && !nneg )
      *curv = CURVATURE_LINEAR;
   else
      *curv = CURVATURE_INDEFINITE;

TERMINATE:
   free(varmap);
   free(a);
   free(eigvals);

   return RETURN_OK;
}

RETURN curvHessian(
   gmoHandle_t gmo,
   int cons,
   CURVATURE* curv
)
{
   int dim;
   int nz;
   int* rowidx;
   int* colidx;
   double* val;
   double* x;
   int numerr;
   int i;
   double r;
   unsigned int seed = 42;

   *curv = CURVATURE_UNKNOWN;

   if( cons >= 0 )
      nz = gmoHessNz(gmo, cons);
   else
      nz = gmoHessLagNz(gmo);

   rowidx = (int*) malloc(nz * sizeof(int));
   colidx = (int*) malloc(nz * sizeof(int));
   val = (double*) malloc(nz * sizeof(double));
   x = (double*) malloc(gmoN(gmo) * sizeof(double));

   for( i = 0; i < gmoN(gmo); ++i )
   {
      double lb;
      double ub;

      lb = gmoGetVarLowerOne(gmo, i);
      ub = gmoGetVarUpperOne(gmo, i);

      r = (double)rand_r(&seed) / (double)RAND_MAX;

      if( lb > 0.0 )
         x[i] = lb * (1-r) + (lb + 0.01*MIN(1.0, ub-lb)) * r;
      else if( ub < 0.0 )
         x[i] = (ub - 0.01*MIN(1.0, ub-lb)) * (1-r) + ub * r;
      else
         x[i] = MAX(lb, -0.01*MIN(1.0, ub-lb)) * (1-r) + MIN(ub, 0.01*MIN(1.0, ub-lb)) * r;
   }

   if( cons >= 0 )
   {
      gmoHessStruct(gmo, cons, rowidx, colidx, &dim, &nz);
      gmoHessValue(gmo, cons, rowidx, colidx, &dim, &nz, x, val, &numerr);
   }
   else
   {
      double* mu;

      mu = (double*) calloc(gmoM(gmo), sizeof(double));

      gmoHessLagStruct(gmo, rowidx, colidx);
      gmoHessLagValue(gmo, x, mu, val, 1.0, -1.0, &numerr);

      free(mu);
   }

   if( numerr == 0 )
   {
      curvQuad(gmo, nz, colidx, rowidx, val, curv);

      switch( *curv )
      {
         case CURVATURE_INDEFINITE :
         case CURVATURE_NONCONVEX :
         case CURVATURE_NONCONCAVE :
            break;

         case CURVATURE_CONVEX :
            *curv = CURVATURE_NONCONCAVE;
            break;

         case CURVATURE_CONCAVE :
            *curv = CURVATURE_NONCONVEX;
            break;

         case CURVATURE_LINEAR : /* if startpoint was chosen so unlucky that we Hessian was 0 */
            *curv = CURVATURE_UNKNOWN;
            break;

         default :
            *curv = CURVATURE_UNKNOWN;
            break;
      }
   }

   free(rowidx);
   free(colidx);
   free(val);
   free(x);

   /* printf("curv cons %d: %s\n", cons, curvname[*curv]); */

   return RETURN_OK;
}
