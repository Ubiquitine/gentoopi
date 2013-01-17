#ifndef _LIBHX_MISC_H
#define _LIBHX_MISC_H 1

#ifndef __cplusplus
#	include <limits.h>
#	include <stdarg.h>
#	include <stdbool.h>
#	include <stdio.h>
#else
#	include <climits>
#	include <cstdarg>
#	include <cstdio>
#endif
#include <libHX/defs.h>
#include <libHX/io.h>

#ifdef __cplusplus
extern "C" {
#endif

/*
 *	BITMAP.H
 */
#define __HXbitmap_bpq(type) \
	(sizeof(type) * CHAR_BIT)
#define HXbitmap_size(type, bits) \
	(((bits) + __HXbitmap_bpq(type) - 1) / __HXbitmap_bpq(type))
#define __HXbitmap_quant(map, bit) \
	((map)[(bit) / __HXbitmap_bpq(*(map))])
#define HXbitmap_set(map, bit) \
	((void)(__HXbitmap_quant((map), (bit)) |= (1ULL << ((bit) % __HXbitmap_bpq(*(map))))))
#define HXbitmap_clear(map, bit) \
	((void)(__HXbitmap_quant((map), (bit)) &= ~(1ULL << ((bit) % __HXbitmap_bpq(*(map))))))
#define HXbitmap_test(map, bit) \
	((bool)(__HXbitmap_quant((map), (bit)) & (1ULL << ((bit) % __HXbitmap_bpq(*(map))))))

#define HX_TIMESPEC_FMT "%ld.%09ld"
#define HX_TIMEVAL_FMT "%ld.%06ld"
#ifdef __cplusplus
#	define HX_TIMESPEC_EXP(p) static_cast<long>((p)->tv_sec), (p)->tv_nsec
#	define HX_TIMEVAL_EXP(p) static_cast<long>((p)->tv_sec), (p)->tv_usec
#else
#	define HX_TIMESPEC_EXP(p) static_cast(long, (p)->tv_sec), (p)->tv_nsec
#	define HX_TIMEVAL_EXP(p) static_cast(long, (p)->tv_sec), (p)->tv_usec
#endif

struct stat;
struct timespec;
struct timeval;

/*
 *	DL.C
 */
extern void *HX_dlopen(const char *);
extern void *HX_dlsym(void *, const char *);
extern void HX_dlclose(void *);
extern const char *HX_dlerror(void);

/*
 *	MISC.C
 */
extern int HX_ffs(unsigned long);
extern int HX_fls(unsigned long);
extern void HX_hexdump(FILE *, const void *, unsigned int);
extern bool HX_timespec_isneg(const struct timespec *);
extern struct timespec *HX_timespec_neg(struct timespec *,
	const struct timespec *);
extern struct timespec *HX_timespec_add(struct timespec *,
	const struct timespec *, const struct timespec *);
extern struct timespec *HX_timespec_sub(struct timespec *,
	const struct timespec *, const struct timespec *);
extern struct timespec *HX_timespec_mul(struct timespec *,
	const struct timespec *, int);
extern struct timespec *HX_timespec_mulf(struct timespec *,
	const struct timespec *, double);
extern struct timeval *HX_timeval_sub(struct timeval *,
	const struct timeval *, const struct timeval *);
extern long HX_time_compare(const struct stat *, const struct stat *, char);
extern void HX_zvecfree(char **);

/*
 *	RAND.C
 */
extern int HX_rand(void);
extern unsigned int HX_irand(unsigned int, unsigned int);
extern double HX_drand(double, double);

/*
 *	INLINE FUNCTIONS
 */
static __inline__ unsigned int HX_zveclen(const char *const *args)
{
	unsigned int argk = 0;
	while (*args++ != NULL)
		++argk;
	return argk;
}

#ifdef __cplusplus
} /* extern "C" */

extern "C++" {

template<typename type> static __inline__ type
HX_dlsym(void *handle, const char *symbol)
{
	return reinterpret_cast<type>(HX_dlsym(handle, symbol));
}

} /* extern "C++" */
#endif

#endif /* _LIBHX_MISC_H */
