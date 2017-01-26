#ifndef CURVCHECK_H_
#define CURVCHECK_H_

#include "def.h"

typedef struct
{
   int nnegeigvals;
   int nposeigvals;
   int nzeroeigvals;
} eigvalcount;

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
   int qdim,
   int qnz,
   int* qcol,
   int* qrow,
   double* qcoef,
   CURVATURE* curv,
   eigvalcount* evcount
);

extern
RETURN curvHessian(
   struct gmoRec* gmo,
   int cons,
   CURVATURE* curv
);

#endif /* CURVCHECK_H_ */
