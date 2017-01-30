#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <assert.h>
#include "png.h"        /* libpng header; includes setjmp.h */
#include "zlib.h"

#include "gmomcc.h"
#include "gevmcc.h"

#include "sparsityplot.h"

/* format docu
 *
 * PNM: http://netpbm.sourceforge.net/doc/pnm.html
 *
 * PNG: http://www.libpng.org/pub/png/book/toc.html
 *      http://libpng.org/pub/png/libpng-1.2.5-manual.html
 *      http://zarb.org/~gc/html/libpng.html
 *      http://www.labbookpages.co.uk/software/imgProc/libPNG.html
 */

RETURN plotSparsityJacobianPPM(
   gmoHandle_t gmo,
   gevHandle_t gev,
   const char* filename
)
{
   FILE* f;
   int i;
   int j;
   int r;
   double* jacval;
   int* nlflag;
   int* colidx;
   int nz;
   int nlnz;

   assert(gmo != NULL);
   assert(gev != NULL);
   assert(filename != NULL);

   /* big files make problem (better write PNG then) */
   if( gmoM(gmo) * gmoN(gmo) > 1000000 )
      return RETURN_OK;

   f = fopen(filename, "w");

   fputs("P3\n", f);
   fprintf(f, "%d %d\n", gmoN(gmo), gmoM(gmo)+1);
   fputs("1\n", f);

   jacval = (double*) malloc(gmoN(gmo) * sizeof(double));
   nlflag = (int*) malloc(gmoN(gmo) * sizeof(int));
   colidx = (int*) malloc(gmoN(gmo) * sizeof(int));

   for( r = -1; r < gmoM(gmo); ++r )
   {
      if( r == -1 )
         gmoGetObjSparse(gmo, colidx, jacval, nlflag, &nz, &nlnz);
      else
         gmoGetRowSparse(gmo, r, colidx, jacval, nlflag, &nz, &nlnz);

      for( i = 0, j = 0; i < gmoN(gmo); ++i )
      {
         if( i > 0 )
            fputs("  ", f);

         if( j == nz || i < colidx[j] )
         {
            /* variable not in objective */
            fputs("1 1 1   ", f);
            continue;
         }
         assert(i == colidx[j]);

         if( nlflag[j] )
         {
            /* nonlinear variable in objective */
            fputs("1 0 0   ", f);
         }
         else
         {
            /* linear variable in objective */
            assert(jacval[j] != 0.0);
            fputs("0 0 0   ", f);
         }

         ++j;
      }
      fputc('\n', f);
   }

   free(jacval);
   free(colidx);
   free(nlflag);

   fclose(f);

   return RETURN_OK;
}

#if 0  /* RGB (3 bytes per pixel) */
RETURN plotSparsityJacobianPNG(
   gmoHandle_t gmo,
   gevHandle_t gev,
   const char* filename
)
{
   FILE* f;
   int i;
   int j;
   int r;
   double* jacval = NULL;
   int* nlflag = NULL;
   int* colidx = NULL;
   int nz;
   int nlnz;
   RETURN rc;

   png_structp png_ptr = NULL;
   png_infop info_ptr = NULL;
   png_text  text[2];
   png_bytep rowdata = NULL;

   assert(gmo != NULL);
   assert(gev != NULL);
   assert(filename != NULL);

   f = fopen(filename, "wb");
   if( !f )
   {
      fprintf(stderr, "Could not create file %s.\n", filename);
      return RETURN_ERROR;
   }

   rc = RETURN_ERROR;

   png_ptr = png_create_write_struct(PNG_LIBPNG_VER_STRING, NULL, NULL, NULL);
   if( !png_ptr )
   {
      fputs("png_create_write_struct failed.\n", stderr);
      goto TERMINATE;
   }

   info_ptr = png_create_info_struct(png_ptr);
   if( !info_ptr )
   {
      fputs("png_create_info_struct failed.\n", stderr);
      goto TERMINATE;
   }

   if( setjmp(png_jmpbuf(png_ptr)) )
   {
      fputs("Error during png creation\n", stderr);
      goto TERMINATE;
   }

   png_init_io(png_ptr, f);

   /* write header */
   png_set_IHDR(png_ptr, info_ptr, gmoN(gmo), gmoM(gmo)+1,
                8, PNG_COLOR_TYPE_RGB, PNG_INTERLACE_NONE,
                PNG_COMPRESSION_TYPE_BASE, PNG_FILTER_TYPE_BASE);

   text[0].compression = PNG_TEXT_COMPRESSION_NONE;
   text[0].key = "Title";
   text[0].text = strdup(filename);
   assert(index(text[0].text, '.') != NULL);
   *index(text[0].text, '.') = '\0';

   text[1].compression = PNG_TEXT_COMPRESSION_NONE;
   text[1].key = "Description";
   text[1].text = "Sparsity Pattern of Objective Gradient and Jacobian";

   png_set_text(png_ptr, info_ptr, text, 2);

   png_write_info(png_ptr, info_ptr);

   png_set_packing(png_ptr);

   jacval = (double*) malloc(gmoN(gmo) * sizeof(double));
   nlflag = (int*) malloc(gmoN(gmo) * sizeof(int));
   colidx = (int*) malloc(gmoN(gmo) * sizeof(int));
   rowdata = (png_bytep) malloc(3 * gmoN(gmo) * sizeof(png_byte));  /* 3 byte per pixel */

   for( r = -1; r < gmoM(gmo); ++r )
   {
      if( r == -1 )
         gmoGetObjSparse(gmo, colidx, jacval, nlflag, &nz, &nlnz);
      else
         gmoGetRowSparse(gmo, r, colidx, jacval, nlflag, &nz, &nlnz);

      for( i = 0, j = 0; i < gmoN(gmo); ++i )
      {
         if( j == nz || i < colidx[j] )
         {
            /* variable not present -> white */
            rowdata[3*i] = 255;
            rowdata[3*i+1] = 255;
            rowdata[3*i+2] = 255;
            continue;
         }
         assert(i == colidx[j]);

         if( nlflag[j] )
         {
            /* nonlinear variable -> red */
            rowdata[3*i] = 255;
            rowdata[3*i+1] = 0;
            rowdata[3*i+2] = 0;
         }
         else
         {
            /* linear variable -> black */
            assert(jacval[j] != 0.0);
            rowdata[3*i] = 0;
            rowdata[3*i+1] = 0;
            rowdata[3*i+2] = 0;
         }

         ++j;
      }

      png_write_row(png_ptr, rowdata);
   }

   png_write_end(png_ptr, NULL);

   rc = RETURN_OK;

TERMINATE:

   png_destroy_write_struct(&png_ptr, &info_ptr);

   free(jacval);
   free(colidx);
   free(nlflag);
   free(rowdata);

   fclose(f);

   return rc;
}
#else /* color palette: 2 bit per pixel */
RETURN plotSparsityJacobianPNG(
   gmoHandle_t gmo,
   gevHandle_t gev,
   const char* filename
)
{
   FILE* f;
   int j;
   int r;
   double* jacval = NULL;
   int* nlflag = NULL;
   int* colidx = NULL;
   int nz;
   int nlnz;
   RETURN rc;

   png_structp png_ptr = NULL;
   png_infop info_ptr = NULL;
   png_text  text[2];
   png_bytep rowdata = NULL;
   png_color palette[3];

   assert(gmo != NULL);
   assert(gev != NULL);
   assert(filename != NULL);

   f = fopen(filename, "wb");
   if( !f )
   {
      fprintf(stderr, "Could not create file %s.\n", filename);
      return RETURN_ERROR;
   }

   rc = RETURN_ERROR;

   png_ptr = png_create_write_struct(PNG_LIBPNG_VER_STRING, NULL, NULL, NULL);
   if( !png_ptr )
   {
      fputs("png_create_write_struct failed.\n", stderr);
      goto TERMINATE;
   }

   info_ptr = png_create_info_struct(png_ptr);
   if( !info_ptr )
   {
      fputs("png_create_info_struct failed.\n", stderr);
      goto TERMINATE;
   }

   if( setjmp(png_jmpbuf(png_ptr)) )
   {
      fputs("Error during png creation\n", stderr);
      goto TERMINATE;
   }

   png_init_io(png_ptr, f);

   /* let zlib try its best */
   png_set_compression_level(png_ptr, Z_BEST_COMPRESSION);

   /* write header */
   png_set_IHDR(png_ptr, info_ptr, gmoN(gmo), gmoM(gmo)+1,
                2, PNG_COLOR_TYPE_PALETTE, PNG_INTERLACE_NONE,
                PNG_COMPRESSION_TYPE_DEFAULT, PNG_FILTER_TYPE_DEFAULT);

   /* white */
   palette[0].blue  = 255;
   palette[0].green = 255;
   palette[0].red   = 255;

   /* red */
   palette[1].blue  = 0;
   palette[1].green = 0;
   palette[1].red   = 255;

   /* black */
   palette[2].blue  = 0;
   palette[2].green = 0;
   palette[2].red   = 0;

   png_set_PLTE(png_ptr, info_ptr, palette, 3);

   text[0].compression = PNG_TEXT_COMPRESSION_NONE;
   text[0].key = "Title";
   text[0].text = strdup(filename);
   assert(index(text[0].text, '.') != NULL);
   *index(text[0].text, '.') = '\0';

   text[1].compression = PNG_TEXT_COMPRESSION_NONE;
   text[1].key = "Description";
   text[1].text = "Sparsity Pattern of Objective Gradient and Jacobian";

   png_set_text(png_ptr, info_ptr, text, 2);

   png_write_info(png_ptr, info_ptr);

   png_set_packing(png_ptr);

   jacval = (double*) malloc(gmoN(gmo) * sizeof(double));
   nlflag = (int*) malloc(gmoN(gmo) * sizeof(int));
   colidx = (int*) malloc(gmoN(gmo) * sizeof(int));
   rowdata = (png_bytep) malloc(gmoN(gmo) * sizeof(png_byte));  /* still need 1 byte per pixel */

   for( r = -1; r < gmoM(gmo); ++r )
   {
      if( r == -1 )
         gmoGetObjSparse(gmo, colidx, jacval, nlflag, &nz, &nlnz);
      else
         gmoGetRowSparse(gmo, r, colidx, jacval, nlflag, &nz, &nlnz);

      memset(rowdata, 0, gmoN(gmo)); /* all white */

      for( j = 0; j < nz; ++j )
      {
         if( nlflag[j] )
         {
            /* nonlinear variable -> red = 1 */
            rowdata[colidx[j]] = 1;
         }
         else if( jacval[j] != 0.0 )  /* can have linear variable with coef 0, if having eps (see flowchan{2,4}00fix) */
         {
            /* linear variable -> black = 2 */
            assert(jacval[j] != 0.0);
            rowdata[colidx[j]] = 2;
         }
      }

      png_write_row(png_ptr, rowdata);
   }

   png_write_end(png_ptr, NULL);

   rc = RETURN_OK;

TERMINATE:

   png_destroy_write_struct(&png_ptr, &info_ptr);

   free(jacval);
   free(colidx);
   free(nlflag);
   free(rowdata);

   fclose(f);

   return rc;
}
#endif

RETURN plotSparsityHessianPBM(
   gmoHandle_t gmo,
   gevHandle_t gev,
   const char* filename
)
{
   FILE* f;
   int i;
   long long pos;
   int* colidx;
   int* rowidx;
   int nz;
   /* int do2dir, dohess; */
   char* pic;
   int picbytes;
   int rowlen;

   assert(gmo != NULL);
   assert(gev != NULL);
   assert(filename != NULL);

   /* big files make problem */
   if( gmoN(gmo) > 10000 )
      return RETURN_OK;

   /* TODO how to find out whether Hessian was already loaded? */
   /*
   do2dir = 0;
   dohess = 1;
   gmoHessLoad(gmo, 0, &do2dir, &dohess);
   if( !dohess )
   {
      fprintf(stderr, "gmoHessLoad did not succeed\n");
      return RETURN_ERROR;
   }
   */

   f = fopen(filename, "w");

   fputs("P4\n", f);
   fprintf(f, "%d %d\n", gmoN(gmo), gmoN(gmo));

   nz = gmoHessLagNz(gmo);

   colidx = (int*) malloc(nz * sizeof(int));
   rowidx = (int*) malloc(nz * sizeof(int));

   gmoHessLagStruct(gmo, rowidx, colidx);

   rowlen = (gmoN(gmo) / 8) + 1;  /* one extra for N%8 */
   picbytes = rowlen * gmoN(gmo);
   pic = (char*) calloc(picbytes, 1);

   for( i = 0; i < nz; ++i )
   {
      pos = rowidx[i] * rowlen * 8 + colidx[i];
      /* printf("row %d col %d -> bit %d = byte %d bit %d\n", rowidx[i], colidx[i], pos, pos/8, 7-pos%8); */
      pic[pos/8] |= 1<<(7 - pos%8);
   }

#if 0
   for( i = 0; i < gmoN(gmo); ++i )
   {
      int j, k;
      for( j = 0; j < rowlen; ++j )
      {
         for( k = 0; k < 8; ++k )
            printf("%d ", pic[i * rowlen + j]&(1<<k) ? 1 : 0 );
         printf("\n");
      }
   }
#endif

   fwrite(pic, picbytes, 1, f);

   free(colidx);
   free(rowidx);
   free(pic);

   fclose(f);

   return RETURN_OK;
}

void sortHessian(int *rowidx, int* colidx, int n)
{
   int p;
   int q;
   int l;
   int r;
   int t;

   if( n < 2 )
      return;

   p = rowidx[n / 2];
   q = colidx[n / 2];
   l = 0;
   r = n - 1;
   while( l <= r )
   {
      if( rowidx[l] < p || (rowidx[l] == p && colidx[l] < q) )
      {
         ++l;
         continue;
      }
      if( rowidx[r] > p || (rowidx[r] == p && colidx[r] > q) )
      {
         --r;
         continue;
      }

      t = rowidx[l];
      rowidx[l] = rowidx[r];
      rowidx[r] = t;

      t = colidx[l];
      colidx[l] = colidx[r];
      colidx[r] = t;

      ++l;
      --r;
   }

   sortHessian(rowidx, colidx, r + 1);
   sortHessian(rowidx+l, colidx+l, n - l);
}


RETURN plotSparsityHessianPNG(
   gmoHandle_t gmo,
   gevHandle_t gev,
   const char* filename
)
{
   FILE* f;
   int i;
   int* colidx = NULL;
   int* rowidx = NULL;
   int nz;
   int row;
   /* int do2dir, dohess; */
   RETURN rc;

   png_structp png_ptr = NULL;
   png_infop info_ptr = NULL;
   png_text  text[2];
   png_bytep rowdata = NULL;
   png_color palette[3];

   assert(gmo != NULL);
   assert(gev != NULL);
   assert(filename != NULL);

   /* TODO how to find out whether Hessian was already loaded? */
   /*
   do2dir = 0;
   dohess = 1;
   gmoHessLoad(gmo, 0, &do2dir, &dohess);
   if( !dohess )
   {
      fprintf(stderr, "gmoHessLoad did not succeed\n");
      return RETURN_ERROR;
   }
   */

   f = fopen(filename, "wb");
   if( !f )
   {
      fprintf(stderr, "Could not create file %s.\n", filename);
      return RETURN_ERROR;
   }

   rc = RETURN_ERROR;

   png_ptr = png_create_write_struct(PNG_LIBPNG_VER_STRING, NULL, NULL, NULL);
   if( !png_ptr )
   {
      fputs("png_create_write_struct failed.\n", stderr);
      goto TERMINATE;
   }

   info_ptr = png_create_info_struct(png_ptr);
   if( !info_ptr )
   {
      fputs("png_create_info_struct failed.\n", stderr);
      goto TERMINATE;
   }

   if( setjmp(png_jmpbuf(png_ptr)) )
   {
      fputs("Error during png creation\n", stderr);
      goto TERMINATE;
   }

   png_init_io(png_ptr, f);

   /* write header */
   png_set_IHDR(png_ptr, info_ptr, gmoN(gmo), gmoN(gmo),
                1, PNG_COLOR_TYPE_PALETTE, PNG_INTERLACE_NONE,
                PNG_COMPRESSION_TYPE_DEFAULT, PNG_FILTER_TYPE_DEFAULT);

   /* white */
   palette[0].blue  = 255;
   palette[0].green = 255;
   palette[0].red   = 255;

   /* black */
   palette[1].blue  = 0;
   palette[1].green = 0;
   palette[1].red   = 0;

   png_set_PLTE(png_ptr, info_ptr, palette, 2);

   text[0].compression = PNG_TEXT_COMPRESSION_NONE;
   text[0].key = "Title";
   text[0].text = strdup(filename);
   assert(index(text[0].text, '.') != NULL);
   *index(text[0].text, '.') = '\0';

   text[1].compression = PNG_TEXT_COMPRESSION_NONE;
   text[1].key = "Description";
   text[1].text = "Sparsity Pattern of Lagrangian Hessian";

   png_set_text(png_ptr, info_ptr, text, 2);

   png_write_info(png_ptr, info_ptr);

   png_set_packing(png_ptr);

   nz = gmoHessLagNz(gmo);

   colidx = (int*) malloc(nz * sizeof(int));
   rowidx = (int*) malloc(nz * sizeof(int));
   rowdata = (png_bytep) malloc(gmoN(gmo) * sizeof(png_byte));  /* still need 1 byte per pixel */

   gmoHessLagStruct(gmo, rowidx, colidx);
   sortHessian(rowidx, colidx, nz);

   i = 0;
   for( row = 0; row < gmoN(gmo); ++row )
   {
      memset(rowdata, 0, gmoN(gmo)); /* all white */

      while( i < nz && rowidx[i] == row )
      {
         rowdata[colidx[i]] = 1;
         ++i;
      }

      png_write_row(png_ptr, rowdata);
   }

   png_write_end(png_ptr, NULL);

   rc = RETURN_OK;

TERMINATE:

   png_destroy_write_struct(&png_ptr, &info_ptr);

   free(colidx);
   free(rowidx);
   free(rowdata);

   fclose(f);

   return rc;
}
