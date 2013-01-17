#ifndef _LIBHX_STRING_H
#define _LIBHX_STRING_H 1

#ifdef __cplusplus
#	include <cstddef>
#	include <cstdio>
#	include <cstdlib>
#	include <cstring>
#else
#	include <stddef.h>
#	include <stdio.h>
#	include <stdlib.h>
#	include <string.h>
#endif
#include <sys/types.h>

#ifdef __cplusplus
extern "C" {
#endif

enum {
	HXQUOTE_SQUOTE = 1,
	HXQUOTE_DQUOTE,
	HXQUOTE_HTML,
	HXQUOTE_LDAPFLT,
	HXQUOTE_LDAPRDN,
	HXQUOTE_BASE64,
	_HXQUOTE_MAX,
};

#ifndef __libhx_internal_hxmc_t_defined
#define __libhx_internal_hxmc_t_defined 1
typedef char hxmc_t;
#endif

/*
 *	MC.C
 */
extern hxmc_t *HXmc_strinit(const char *);
extern hxmc_t *HXmc_meminit(const void *, size_t);
extern hxmc_t *HXmc_strcpy(hxmc_t **, const char *);
extern hxmc_t *HXmc_memcpy(hxmc_t **, const void *, size_t);
extern size_t HXmc_length(const hxmc_t *);
extern hxmc_t *HXmc_setlen(hxmc_t **, size_t);
extern hxmc_t *HXmc_trunc(hxmc_t **, size_t);
extern hxmc_t *HXmc_strcat(hxmc_t **, const char *);
extern hxmc_t *HXmc_memcat(hxmc_t **, const void *, size_t);
extern hxmc_t *HXmc_strpcat(hxmc_t **, const char *);
extern hxmc_t *HXmc_mempcat(hxmc_t **, const void *, size_t);
extern hxmc_t *HXmc_strins(hxmc_t **, size_t, const char *);
extern hxmc_t *HXmc_memins(hxmc_t **, size_t, const void *, size_t);
extern hxmc_t *HXmc_memdel(hxmc_t *, size_t, size_t);
extern void HXmc_free(hxmc_t *);
extern void HXmc_zvecfree(hxmc_t **);

/*
 *	STRING.C
 */
extern char *HX_basename(const char *);
extern char *HX_basename_exact(const char *);
extern char *HX_chomp(char *);
extern char *HX_dirname(const char *);
extern hxmc_t *HX_getl(hxmc_t **, FILE *);
extern void *HX_memmem(const void *, size_t, const void *, size_t);
extern char **HX_split(const char *, const char *, int *, int);
extern char **HX_split4(char *, const char *, int *, int);
extern int HX_split5(char *, const char *, int, char **);
extern char *HX_strbchr(const char *, const char *, char);
extern char *HX_strclone(char **, const char *);
extern char *HX_strdup(const char *);
extern char *HX_strlcat(char *, const char *, size_t);
extern char *HX_strlcpy(char *, const char *, size_t);
extern char *HX_strlncat(char *, const char *, size_t, size_t);
extern char *HX_strlower(char *);
extern size_t HX_strltrim(char *);
extern char *HX_strmid(const char *, long, long);
extern char *HX_strndup(const char *, size_t);
extern size_t HX_strnlen(const char *, size_t);
extern char *HX_strquote(const char *, unsigned int, char **);
extern size_t HX_strrcspn(const char *, const char *);
extern char *HX_strrev(char *);
extern size_t HX_strrtrim(char *);
extern char *HX_strsep(char **, const char *);
extern char *HX_strsep2(char **, const char *);
extern char *HX_strupper(char *);

static __inline__ void *HX_memdup(const void *buf, size_t len)
{
	void *ret;
	if ((ret = malloc(len)) == NULL)
		return NULL;
	return memcpy(ret, buf, len);
}

#ifdef __cplusplus
} /* extern "C" */
#endif

#ifdef __cplusplus
extern "C++" {

template<typename type> static __inline__ type
HX_memdup(const void *data, size_t n)
{
	return reinterpret_cast<type>(HX_memdup(data, n));
}

} /* extern "C++" */
#endif

#endif /* _LIBHX_STRING_H */
