#ifndef DEF_H
#define DEF_H

#define CHECK( x ) \
   do \
   { \
      RETURN _retcode = (x); \
      if( _retcode != RETURN_OK ) \
      { \
         fprintf(stderr, __FILE__ ":%d Error %d from call " #x "\n", __LINE__, _retcode); \
         return _retcode; \
      } \
   } while( 0 )

#define XMN_CHECK( xmn, x ) \
   do \
   { \
      int _retcode = (x); \
      if( _retcode != XMN_RC_OK ) \
      { \
         if( (xmn) != NULL ) fprintf(stderr, "%s\n", XMNgetErrorMsg(xmn)); \
         fprintf(stderr, __FILE__ ":%d Error %d from call " #x "\n", __LINE__, _retcode); \
         return RETURN_ERROR; \
      } \
   } while( 0 )

#define CHECK_SCIP( x ) \
   do \
   { \
      int _retcode = (x); \
      if( _retcode != SCIP_OKAY ) \
      { \
         fprintf(stderr, __FILE__ ":%d Error %d from call " #x "\n", __LINE__, _retcode); \
         return RETURN_ERROR; \
      } \
   } while( 0 )

#ifndef MAX
#define MAX( a, b ) ((a) > (b) ? (a) : (b))
#endif

#ifndef MIN
#define MIN( a, b ) ((a) < (b) ? (a) : (b))
#endif

typedef enum {
    RETURN_OK = 0,
    RETURN_ERROR = 1
} RETURN;

struct gmoRec;
struct gevRec;

/** Curvature types */
typedef enum
{
   CURVATURE_INDEFINITE = 1,             /**< proven to be neither convex nor concave */
   CURVATURE_CONVEX     = 2,             /**< convex */
   CURVATURE_CONCAVE    = 4,             /**< concave */
   CURVATURE_LINEAR     = CURVATURE_CONVEX & CURVATURE_CONCAVE, /**< linear = convex and concave */ /* 0 */

   CURVATURE_NONCONCAVE = CURVATURE_INDEFINITE | CURVATURE_CONVEX,  /**< proven to be not strictly concave (i.e., convex or indefinite) */ /* 3 */
   CURVATURE_NONCONVEX  = CURVATURE_INDEFINITE | CURVATURE_CONCAVE, /**< proven to be not strictly convex (i.e., concave or indefinite) */ /* 5 */
   CURVATURE_UNKNOWN    = CURVATURE_INDEFINITE | CURVATURE_CONVEX | CURVATURE_CONCAVE,  /**< unknown (not checked or not conclusive) */ /* 7 */
} CURVATURE;

#if defined(__GNUC__)
__attribute__((unused))
#endif
static const char const* curvname[] = { "linear", "indefinite", "convex", "nonconcave", "concave", "nonconvex", (void*)0x0, "unknown" };

#if defined(__GNUC__)
__attribute__((unused))
#endif
static short curvdecided[] = { 1, 1, 1, 0, 1, 0, 0, 0 };  /* = whether at most one bit is set */

typedef enum
{
   FUNCTYPE_CONSTANT   = 0,
   FUNCTYPE_LINEAR     = 1,
   FUNCTYPE_QUADRATIC  = 2,
   FUNCTYPE_POLYNOMIAL = 3,
   FUNCTYPE_SIGNOMIAL  = 4,
   FUNCTYPE_NONLINEAR  = 5,
} FUNCTYPE;

#if defined(__GNUC__)
__attribute__((unused))
#endif
static const char const* functypename[] = { "constant", "linear", "quadratic", "polynomial", "signomial", "nonlinear" };

#endif

