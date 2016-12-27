#ifndef SPARSITYPLOT_H_
#define SPARSITYPLOT_H_

#include "def.h"

extern
void sortHessian(
   int* rowidx,
   int* colidx,
   int n
);

extern
RETURN plotSparsityJacobianPPM(
   gmoHandle_t gmo,
   gevHandle_t gev,
   const char* filename
);

extern
RETURN plotSparsityJacobianPNG(
   gmoHandle_t gmo,
   gevHandle_t gev,
   const char* filename
);

extern
RETURN plotSparsityHessianPBM(
   gmoHandle_t gmo,
   gevHandle_t gev,
   const char* filename
);

extern
RETURN plotSparsityHessianPNG(
   gmoHandle_t gmo,
   gevHandle_t gev,
   const char* filename
);

#endif /* SPARSITYPLOT_H_ */
