#ifndef CURVCHECK_H_
#define CURVCHECK_H_

#include "def.h"

extern
CURVATURE curvNegate(
   CURVATURE curv
   );

extern
void curvAugment(
   CURVATURE* curvconss,
   CURVATURE  curv
   );

extern
RETURN curvQuad(
   struct gmoRec* gmo,
   int qnz,
   int* qcol,
   int* qrow,
   double* qcoef,
   CURVATURE* curv
);

extern
RETURN curvHessian(
   struct gmoRec* gmo,
   int cons,
   CURVATURE* curv
);

#endif /* CURVCHECK_H_ */
