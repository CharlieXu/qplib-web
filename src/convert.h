#ifndef CONVERT_H_
#define CONVERT_H_

#include "def.h"

#define CONVERT_DOUBLEFORMAT "%.15g"

extern
void convertEndLine(
   FILE*       file,
   char*       linebuffer,
   int*        linecnt
);

extern
void convertAppendLine(
   FILE*       file,
   char*       linebuffer,
   int*        linecnt,
   const char* extension
);

extern
void convertGetVarName(
   struct gmoRec* gmo,
   int         idx,
   char*       buffer
   );

extern
void convertGetEquName(
   struct gmoRec* gmo,
   int         idx,
   char*       buffer
   );

extern
RETURN writeLP(
   struct gmoRec* gmo,
   struct gevRec* gev,
   const char*    filename
);

#endif /* CONVERT_H_ */
