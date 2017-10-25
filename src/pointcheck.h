#ifndef POINTCHECK_H
#define POINTCHECK_H

#include "def.h"

extern
RETURN pointInfeasibility(
   gmoHandle_t gmo,
   gevHandle_t gev,
   double*     infeasibility
);

#endif
