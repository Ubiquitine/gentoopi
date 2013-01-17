#ifndef _LIBHX_OPTION_H
#define _LIBHX_OPTION_H 1

#ifdef __cplusplus
#	include <cstddef>
#	include <cstdio>
#else
#	include <stddef.h>
#	include <stdio.h>
#endif

#ifdef __cplusplus
extern "C" {
#endif

#ifndef __libhx_internal_hxmc_t_defined
#define __libhx_internal_hxmc_t_defined 1
typedef char hxmc_t;
#endif

struct HXoption;

/*
 *	FORMAT.C
 */
extern struct HXformat_map *HXformat_init(void);
extern void HXformat_free(struct HXformat_map *);
extern int HXformat_add(struct HXformat_map *, const char *, const void *,
	unsigned int);
extern int HXformat_aprintf(const struct HXformat_map *,
	hxmc_t **, const char *);
extern int HXformat_sprintf(const struct HXformat_map *,
	char *, size_t, const char *);
extern int HXformat_fprintf(const struct HXformat_map *,
	FILE *, const char *);

/*
 *	OPT.C
 */

/**
 * Available types for struct HXoption.type.
 * %HXTYPE_NONE:	[-o] (int *) No argument; counts presence.
 * %HXTYPE_VAL:		[-o] (int *) Set to value in .val.
 * %HXTYPE_SVAL:	[-o] (const char *) Set to value in .uptr.
 * %HXTYPE_BOOL:	[fo] (int *) Parse argument as boolean
 * 			     ("yes", "no", "true", "false", 0 or non-zero)
 * %HXTYPE_BYTE:	[fo] (unsigned char *) Take first char of argument
 * %HXTYPE_UCHAR:	[fo] (unsigned char *) An integer.
 * %HXTYPE_CHAR:	[fo] (char *) An integer.
 * %HXTYPE_USHORT:	[fo] (unsigned short *) An integer.
 * %HXTYPE_SHORT:	[fo] (short *) An integer.
 * %HXTYPE_UINT:	[fo] (unsigned int *) An integer.
 * %HXTYPE_INT:		[fo] (int *) An integer.
 * %HXTYPE_ULONG:	[fo] (unsigned long *) An integer.
 * %HXTYPE_LONG:	[fo] (long *) An integer.
 * %HXTYPE_ULLONG:	[fo] (unsigned long long *) An integer.
 * %HXTYPE_LLONG:	[fo] (long long *) An integer.
 * %HXTYPE_FLOAT:	[fo] (float *) Read a floating point number
 * %HXTYPE_DOUBLE:	[fo] (double *) Read a floating point number
 * %HXTYPE_STRING:	[fo] (char **) Any string.
 * %HXTYPE_STRP:	[f-] (const char *const *) A string.
 * %HXTYPE_STRDQ:	[-o] (struct HXdeque *) A string.
 * %HXTYPE_UINT8:	[-o] (uint8_t *) An integer.
 * %HXTYPE_UINT16:	[-o] (uint8_t *) An integer.
 * %HXTYPE_UINT32:	[-o] (uint8_t *) An integer.
 * %HXTYPE_UINT64:	[-o] (uint8_t *) An integer.
 * %HXTYPE_INT8:	[-o] (uint8_t *) An integer.
 * %HXTYPE_INT16:	[-o] (uint8_t *) An integer.
 * %HXTYPE_INT32:	[-o] (uint8_t *) An integer.
 * %HXTYPE_INT64:	[-o] (uint8_t *) An integer.
 * %HXTYPE_MCSTR:	[-o] (hxmc_t *) A string.
 * %HXTYPE_XSNTMARK:	[-o] Internal sentinal marker (used in HXOPT_TABLEEND)
 * %HXTYPE_XHELP:	[-o] Internal helper marker (used in HXOPT_AUTOHELP)
 * %HXTYPE_SIZE_T:	[-o] (size_t *) An integer.
 *
 * Type expected of struct HXoption.ptr is given in ().
 * HX_getopt (o) and HXformat_* (f) support different sets, marked with [].
 */
enum HX_option_type {
	HXTYPE_NONE = 0,
	HXTYPE_VAL,
	HXTYPE_SVAL,
	HXTYPE_BOOL,
	HXTYPE_BYTE,
	HXTYPE_UCHAR, /* 5 */
	HXTYPE_CHAR,
	HXTYPE_USHORT,
	HXTYPE_SHORT,
	HXTYPE_UINT,
	HXTYPE_INT, /* 10 */
	HXTYPE_ULONG,
	HXTYPE_LONG,
	HXTYPE_ULLONG,
	HXTYPE_LLONG,
	HXTYPE_FLOAT, /* 15 */
	HXTYPE_DOUBLE,
	HXTYPE_STRING,
	HXTYPE_STRP, /* (const char **) */
	HXTYPE_STRDQ,
	HXTYPE_UINT8, /* 20 */
	HXTYPE_UINT16,
	HXTYPE_UINT32,
	HXTYPE_UINT64,
	HXTYPE_INT8,
	HXTYPE_INT16, /* 25 */
	HXTYPE_INT32,
	HXTYPE_INT64,
	HXTYPE_MCSTR,
	HXTYPE_XSNTMARK,
	HXTYPE_XHELP, /* 30 */
	HXTYPE_SIZE_T,
};

/**
 * Extra flags to be OR'ed into struct HXoption.type.
 * %HXOPT_OPTIONAL:	argument to option is optional
 * 			(it's bad taste to use this)
 * %HXOPT_INC:		increase variable pointed to by .ptr.
 * 			(only applies to %HXTYPE_NONE)
 * %HXOPT_DEC:		increase variable pointed to by .ptr.
 * 			(only applies to %HXTYPE_NONE)
 * %HXOPT_NOT:		negate input (*ptr), this is done before OR/AND
 * %HXOPT_OR:		OR *ptr by argument
 * %HXOPT_AND:		AND *ptr by argument
 * %HXOPT_XOR:		XOR *ptr by argument
 */
enum {
	HXOPT_OPTIONAL = 1 << 6,
	HXOPT_INC      = 1 << 7,
	HXOPT_DEC      = 1 << 8,
	HXOPT_NOT      = 1 << 9,
	HXOPT_OR       = 1 << 10,
	HXOPT_AND      = 1 << 11,
	HXOPT_XOR      = 1 << 12,
};

/**
 * Flags (4th arg) to HX_getopt.
 * %HXOPT_PTHRU:	pass-through unknown options to new argv
 * %HXOPT_DESTROY_OLD:	destroy old argv after parsing is successful
 * %HXOPT_QUIET:	do not output any warnings to stderr
 * %HXOPT_HELPONERR:	print out help when a parsing error occurs
 * %HXOPT_USAGEONERR:	print out short usage when a parsing error occurs
 * %HXOPT_RQ_ORDER:	require option order/POSIX mode:
 * 			first non-option terminates option processing
 */
enum {
	HXOPT_PTHRU       = 1 << 0,
	HXOPT_DESTROY_OLD = 1 << 1,
	HXOPT_QUIET       = 1 << 2,
	HXOPT_HELPONERR   = 1 << 3,
	HXOPT_USAGEONERR  = 1 << 4,
	HXOPT_RQ_ORDER    = 1 << 5,
};

/**
 * (Positive-ranged) return values for HX_getopt.
 * %HXOPT_ERR_SUCCESS:	success
 * %HXOPT_ERR_UNKN:	unknown option was encountered
 * %HXOPT_ERR_VOID:	long option takes no value
 * %HXOPT_ERR_MIS:	option requires a value argument
 */
enum {
	HXOPT_ERR_SUCCESS = 0,
	HXOPT_ERR_UNKN,
	HXOPT_ERR_VOID,
	HXOPT_ERR_MIS,
};

/**
 * Extra flags to be OR'ed into HXformat_add()'s 4th arg.
 * %HXFORMAT_IMMED:	do not dereference the 4th arg to get at the value
 */
enum {
	HXFORMAT_IMMED = 1 << 13,
};

/**
 * Flags for HX_shconfig_pv()
 * %SHCONF_ONE:		only read one configuration file
 */
enum {
	SHCONF_ONE = 1 << 0,
};

/**
 * Flags in struct HXoptcb.flags
 * %HXOPTCB_BY_LONG:	cb was called by invocation of @current->ln
 * %HXOPTCB_BY_SHORT:	cb was called by invocation of @current->sh
 */
enum {
	HXOPTCB_BY_LONG  = 1 << 0,
	HXOPTCB_BY_SHORT = 1 << 1,
};

struct HXoptcb {
	const struct HXoption *table, *current;
	const char *data;
	union {
		double data_dbl;
		long data_long;
	};
	unsigned int flags;
};

/**
 * @ln:		long option string (without "--"), or %NULL
 * @sh:		short option character, or '\0'
 * @type:	type of variable pointed to by .ptr
 * @ptr:	pointer to variable to set/update
 * @uptr:	freeform user-supplied pointer;
 * 		in case of %HXTYPE_SVAL, this is the specific value to set
 * @cb:		callback function to invoke, or %NULL
 * @val:	specific value to set if type == HXTYPE_VAL
 * @help:	help string to display
 * @htyp:	type string to show in option's help
 */
struct HXoption {
	const char *ln;
	char sh;
	unsigned int type;
	void *ptr, *uptr;
	void (*cb)(const struct HXoptcb *);
	int val;
	const char *help, *htyp;
};

extern int HX_getopt(const struct HXoption *, int *, const char ***,
	unsigned int);
extern void HX_getopt_help(const struct HXoptcb *, FILE *);
extern void HX_getopt_help_cb(const struct HXoptcb *);
extern void HX_getopt_usage(const struct HXoptcb *, FILE *);
extern void HX_getopt_usage_cb(const struct HXoptcb *);
extern int HX_shconfig(const char *, const struct HXoption *);
extern struct HXmap *HX_shconfig_map(const char *);
extern int HX_shconfig_pv(const char **, const char *,
	const struct HXoption *, unsigned int);
extern void HX_shconfig_free(const struct HXoption *);

#ifdef __cplusplus
} /* extern "C" */
#endif

#ifndef __cplusplus
#	define HXOPT_AUTOHELP \
		{.ln = "help", .sh = '?', .type = HXTYPE_XHELP, \
		.cb = HX_getopt_help_cb, .help = "Show this help message"}, \
		{.ln = "usage", .type = HXTYPE_NONE, \
		.cb = HX_getopt_usage_cb, \
		.help = "Display brief usage message"}
#	define HXOPT_TABLEEND {.type = HXTYPE_XSNTMARK}
#else
#	define HXOPT_AUTOHELP \
		{NULL, '?', HXTYPE_XHELP, NULL, NULL, HX_getopt_help_cb, \
		0, "Show this help message"}
#	define HXOPT_TABLEEND {NULL, 0, HXTYPE_XSNTMARK}
#endif

#endif /* _LIBHX_OPTION_H */
