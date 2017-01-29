#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <assert.h>

#include "gmomcc.h"
#include "gevmcc.h"

#include "loadgms.h"
#include "convert.h"

int main(
   int argc,
   char** argv
   )
{
   gmoHandle_t gmo = NULL;
   gevHandle_t gev = NULL;

   if( argc < 3 )
   {
      printf("usage: %s <inputfile> <outputfile>\n", argv[0]);
      return 1;
   }

   if( strlen(argv[1]) >= 4 && strcmp(&argv[1][strlen(argv[1])-4], ".gms") == 0 )
   {
      CHECK( loadGMS(&gmo, &gev, argv[1]) );

      // if we cannot reformulate, then keep original objective style/type, so we can recognize the objective variable
      if( !gmoObjReform(gmo) )
         gmoObjStyleSet(gmo, gmoObjType_Var);

      gmoUseQSet(gmo, 1);
   }

   if( gmo != NULL && strlen(argv[2]) >= 3 && strcmp(&argv[2][strlen(argv[2])-3], ".lp") == 0 )
   {
      CHECK( writeLP(gmo, gev, argv[2]) );
   }
   else if( gmo != NULL && strlen(argv[2]) >= 6 && strcmp(&argv[2][strlen(argv[2])-6], ".qplib") == 0 )
   {
      CHECK( writeQPLIB(gmo, gev, argv[2]) );
   }
   else
   {
      fputs("Input or Output format not recognized or not supported from filename.\n", stderr);
      return RETURN_ERROR;
   }

   return RETURN_OK;
}
