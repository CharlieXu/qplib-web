#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <assert.h>

#include "gmomcc.h"
#include "gevmcc.h"

#include "curvcheck.h"

#ifdef HAVE_CHOLMOD
#include "cholmod.h"
#endif

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

#ifdef HAVE_CHOLMOD
static
RETURN cholesky(
   int qnz,
   int* qcol,
   int* qrow,
   double* qcoef,
   int dim,
   CURVATURE* curv
   )
{
   cholmod_triplet T;
   cholmod_sparse* A;
   cholmod_common c;
   cholmod_factor* L;
   int i;

   /* TODO augment incoming curv, don't just reset */
   *curv = CURVATURE_UNKNOWN;

   /* ensure that matrix from GMO is of lower-left form */
   for( i = 0; i < qnz; ++i )
   {
      if( qcol[i] > qrow[i] )
      {
         int tmp = qcol[i];
         qcol[i] = qrow[i];
         qrow[i] = tmp;
      }
      /* printf("T row %d col %d = %g\n", qrow[i], qcol[i], qcoef[i]); */
   }

   cholmod_start(&c);
   c.quick_return_if_not_posdef = 1;
   c.final_ll = 1;  /* otherwise may not recognize non-positive semidefinite matrices */
   c.final_monotonic = 0;  /* skip ordering columns, as we throw away result anyway */
   c.final_pack = 0;  /* skip packing columns, as we throw away result anyway */
   c.print = 0;  /* not even errors */

   T.nrow = dim;
   T.ncol = dim;
   T.nzmax = qnz;
   T.nnz = qnz;
   T.i = qrow;
   T.j = qcol;
   T.x = qcoef;
   T.z = NULL;
      /* Describes what parts of the matrix are considered:
      *
      * 0:  matrix is "unsymmetric": use both upper and lower triangular parts
      *     (the matrix may actually be symmetric in pattern and value, but
      *     both parts are explicitly stored and used).  May be square or
      *     rectangular.
      * >0: matrix is square and symmetric.  Entries in the lower triangular
      *     part are transposed and added to the upper triangular part when
      *     the matrix is converted to cholmod_sparse form.
      * <0: matrix is square and symmetric.  Entries in the upper triangular
      *     part are transposed and added to the lower triangular part when
      *     the matrix is converted to cholmod_sparse form.
      */
   /* we ensured above that for the Hessian from GMO, only the lower-left triangle is given
    * stype = 1 should be the corresponding setting
    */
   T.stype = 1;
   T.itype = CHOLMOD_INT;  /* CHOLMOD_LONG: i and j are SuiteSparse_long.  Otherwise int */
   T.xtype = CHOLMOD_REAL;  /* pattern, real, complex, or zomplex */
   T.dtype = CHOLMOD_DOUBLE;  /* x and z are double or float */

   A = cholmod_triplet_to_sparse(&T, qnz, &c);
   assert(A != NULL);
   /* cholmod_print_sparse(A, "A", &c); */

   L = cholmod_analyze(A, &c);
   if( c.status == CHOLMOD_NOT_POSDEF )
   {
      *curv = CURVATURE_NONCONVEX;
   }
   else if( c.status != CHOLMOD_OK )
   {
      fprintf(stderr, "error %d from cholmod_analyze on A\n", c.status);
      goto TERMINATE;
   }
   assert(L != NULL);

   if( *curv == CURVATURE_UNKNOWN )
   {
      cholmod_factorize(A, L, &c);
      if( c.status == CHOLMOD_NOT_POSDEF )
      {
         *curv = CURVATURE_NONCONVEX;
      }
      else if( c.status == CHOLMOD_OK )
      {
         *curv = CURVATURE_CONVEX;
         goto TERMINATE;
      }
      else
      {
         fprintf(stderr, "error %d from cholmod_factorize on A\n", c.status);
         goto TERMINATE;
      }

      /* cholmod_print_factor(L, "L", &c); */
      /* printf("check factor: %d\n", cholmod_check_factor(L, &c)); */

      assert(L->minor < L->n);  /* we should have found to be not positive semidefinite */
   }

   assert(*curv == CURVATURE_NONCONVEX);

   /* now check whether concave, i.e., whether -A is positive semidefinite */
   cholmod_free_factor(&L, &c);

   /* negate matrix */
   for( i = 0; i < A->nzmax; ++i )
      ((double*)A->x)[i] = -((double*)A->x)[i];

   L = cholmod_analyze(A, &c);
   if( c.status == CHOLMOD_NOT_POSDEF )
   {
      *curv = CURVATURE_INDEFINITE;
      goto TERMINATE;
   }
   else if( c.status != CHOLMOD_OK )
   {
      fprintf(stderr, "error %d from cholmod_analyze on -A\n", c.status);
      goto TERMINATE;
   }
   assert(L != NULL);

   cholmod_factorize(A, L, &c);
   if( c.status == CHOLMOD_NOT_POSDEF )
   {
      *curv = CURVATURE_INDEFINITE;
   }
   else if( c.status == CHOLMOD_OK )
   {
      *curv = CURVATURE_CONCAVE;
   }
   else
   {
      fprintf(stderr, "error %d from cholmod_factorize on -A\n", c.status);
   }

   /* cholmod_print_factor(L, "L", &c); */
   /* printf("check factor: %d\n", cholmod_check_factor(L, &c)); */

TERMINATE:
   cholmod_free_factor(&L, &c);
   cholmod_free_sparse(&A, &c);
   cholmod_finish(&c);

   return RETURN_OK;
}
#endif

RETURN curvSample(
   int n,
   int qnz,
   int* qcol,
   int* qrow,
   double* qcoef,
   CURVATURE* curv
   )
{
   int i;
   int iter;
   unsigned int seed = 42;
   double prod;
   double* x;

   assert(qcol != NULL);
   assert(qrow != NULL);
   assert(qcoef != NULL);
   assert(curv != NULL);

   x = (double*) malloc(n * sizeof(double));

   for( iter = 0; iter < n/10 && !curvdecided[*curv]; ++iter )
   {
      /* generate random trial point (values in [-1.0,1.0]) */
      for( i = 0; i < n; ++i )
         x[i] = 2.0 * (double)rand_r(&seed) / (double)RAND_MAX - 1.0;

      /* compute x'*Q*x */
      prod = 0.0;
      for( i = 0; i < qnz; ++i )
         prod += qcoef[i] * x[qcol[i]] * x[qrow[i]];

      /* conclude on curvature of Q */
      if( prod > 1e-9 )
         curvAugment(curv, CURVATURE_NONCONCAVE);
      else if( prod < -1e-9)
         curvAugment(curv, CURVATURE_NONCONVEX);
      /* printf("prod = %g -> curv = %s\n", prod, curvname[*curv]); */
   }

   free(x);

   return RETURN_OK;
}

RETURN curvQuad(
   int qdim,
   int qnz,
   int* qcol,
   int* qrow,
   double* qcoef,
   CURVATURE* curv,
   eigvalcount* evcount
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

   varmap = (int*)malloc(qdim * sizeof(int));
   for( i = 0; i < qdim; ++i )
      varmap[i] = -1;

   *curv = CURVATURE_UNKNOWN;

   dim = 0;
   npos = 0;
   nneg = 0;
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
         {
            curvAugment(curv, CURVATURE_NONCONCAVE);
            ++npos;
         }
         else if( qcoef[i] < -1e-9 )
         {
            curvAugment(curv, CURVATURE_NONCONVEX);
            ++nneg;
         }

         /* if curvature was all we needed, then can stop here */
         if( curvdecided[*curv] && evcount == NULL )
            goto TERMINATE;
      }
   }

   if( qnz == npos + nneg && evcount != NULL )
   {
      /* if matrix is diagonal, then we can decide on curvature and count on eigenvalues */
      if( *curv == CURVATURE_NONCONCAVE )
         *curv = CURVATURE_CONVEX;
      else if( *curv == CURVATURE_NONCONVEX )
         *curv = CURVATURE_CONCAVE;
      assert(curvdecided[*curv]);  /* otherwise dim=0... */

      evcount->nposeigvals = npos;
      evcount->nnegeigvals = nneg;

      goto TERMINATE;

   }

   if( evcount == NULL )
   {
      /* try with some sampling, if we don't have to compute eigenvalues */
      curvSample(dim, qnz, qcol, qrow, qcoef, curv);
      if( curvdecided[*curv] )
         goto TERMINATE;
   }

#ifdef HAVE_CHOLMOD
   if( dim > 10 && evcount == NULL )
   {
      cholesky(qnz, qcol, qrow, qcoef, dim, curv);
      /* it seems that CHOLMOD sometimes concludes a matrix as not positive-semidefinite,
       * though Lapack below might actually conclude that all eigenvalues are >= 0 (-1e-9)
       * thus, retry with Lapack if CHOLMOD concludes indefinite
       */
      if( curvdecided[*curv] && *curv != CURVATURE_INDEFINITE )
         goto TERMINATE;
      /* printf("falling back to lapack...\n"); */
   }
#endif

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

   if( evcount != NULL )
   {
      evcount->nposeigvals = npos;
      evcount->nnegeigvals = nneg;
   }

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
      curvQuad(gmoN(gmo), nz, colidx, rowidx, val, curv, NULL);

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
