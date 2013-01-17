#ifndef _CRYPTMOUNT_H
#define _CRYPTMOUNT_H 1

#include <libHX/string.h>
#ifndef __cplusplus
#	include <stdbool.h>
#endif

#ifdef __cplusplus
extern "C" {
#endif

/**
 * Mnemonics for functions expecting a "blkdev?" argument, e.g. ehd_is_luks.
 * %EHD_BLKDEV_NEEDED:	the argument may not be a block device
 * %EHD_BLKDEV_ASSURED:	the argument is assured to be a block device
 */
enum {
	EHD_BLKDEV_UNKNOWN = 0,
	EHD_BLKDEV_ASSURED = 1,
};

/**
 * Result codes for ehd_keydec_run
 * %EHD_KEYDEC_SUCCESS:		no error
 * %EHD_KEYDEC_NODIGEST:	the digest is not known
 * %EHD_KEYDEC_NOCIPHER:	the cipher is not known
 * %EHD_KEYDEC_OTHER:		other unspecified error
 */
enum {
	EHD_KEYDEC_SUCCESS = 0,
	EHD_KEYDEC_NODIGEST,
	EHD_KEYDEC_NOCIPHER,
	EHD_KEYDEC_OTHER,
};

/**
 * Result codes for ehd_cipherdigest_security
 * (negative indicates system error code).
 *
 * %EHD_SECURITY_BLACKLISTED:	cipher/digest classified as absolute no-go
 * %EHD_SECURITY_SUBPAR:	use of cipher/digest is disrecommended
 * %EHD_SECURITY_UNSPEC:	no verdict
 * %EHD_SECURITY_ADEQUATE:	cipher/digest passes
 *
 * Ordering is supported, x < %EHD_SECURITY_* may be used.
 */
enum {
	EHD_SECURITY_BLACKLISTED = 0,
	EHD_SECURITY_SUBPAR,
	EHD_SECURITY_UNSPEC,
	EHD_SECURITY_ADEQUATE,
};

enum ehd_kdreq_opt {
	EHD_KDREQ_KEYFILE = 1,
	EHD_KDREQ_DIGEST,
	EHD_KDREQ_CIPHER,
	EHD_KDREQ_PASSWORD,
};

enum ehd_mtreq_opt {
	EHD_MTREQ_CONTAINER = 1,
	EHD_MTREQ_MOUNTPOINT,
	EHD_MTREQ_FS_CIPHER,
	EHD_MTREQ_FS_HASH,
	EHD_MTREQ_KEY_DATA,
	EHD_MTREQ_KEY_SIZE,
	EHD_MTREQ_TRUNC_KEYSIZE,
	EHD_MTREQ_READONLY,
	EHD_MTREQ_CRYPTONAME,
};

enum ehd_mtinfo_opt {
	EHD_MTINFO_CONTAINER = 1,
	EHD_MTINFO_CRYPTONAME,
	EHD_MTINFO_CRYPTODEV,
	EHD_MTINFO_LOOPDEV,
};

struct ehd_mount_info;
struct ehd_mount_request;

extern int cryptmount_init(void);
extern void cryptmount_exit(void);

extern struct ehd_mount_request *ehd_mtreq_new(void);
extern void ehd_mtreq_free(struct ehd_mount_request *);
extern int ehd_mtreq_set(struct ehd_mount_request *, enum ehd_mtreq_opt, ...);

extern int ehd_mtinfo_get(struct ehd_mount_info *, enum ehd_mtinfo_opt, void *);
extern void ehd_mtinfo_free(struct ehd_mount_info *);

extern int ehd_load(const struct ehd_mount_request *, struct ehd_mount_info **);
extern int ehd_unload(struct ehd_mount_info *);
extern int ehd_is_luks(const char *, bool);

extern struct ehd_keydec_request *ehd_kdreq_new(void);
extern int ehd_kdreq_set(struct ehd_keydec_request *, enum ehd_kdreq_opt, ...);
extern int ehd_keydec_run(struct ehd_keydec_request *, char **);
extern void ehd_kdreq_free(struct ehd_keydec_request *);
extern const char *ehd_keydec_strerror(int);

extern int ehd_cipherdigest_security(const char *);
extern hxmc_t *ehd_get_password(const char *);

/*
 *	log.c
 */
/**
 * %EHDLOG_FT_DEBUG:	enable debugging
 * %EHDLOG_FT_NOSYSLOG:	disable logging to syslog
 * 			(only program code should call this, never library code)
 */
enum ehd_log_feature {
	EHD_LOGFT_DEBUG    = 1,
	EHD_LOGFT_NOSYSLOG,
	__EHD_LOGFT_MAX,
};

enum {
	EHD_LOG_UNSET = -1,
	EHD_LOG_GET   = 0,
	EHD_LOG_SET   = 1,
};

extern int ehd_logctl(enum ehd_log_feature, ...);
extern int ehd_dbg(const char *, ...);
extern int ehd_err(const char *, ...);

/*
 *	loop.c
 */
enum {
	EHD_LOSETUP_RW = 0,
	EHD_LOSETUP_RO = 1,
};

extern int ehd_loop_setup(const char *, char **, bool);
extern int ehd_loop_release(const char *);


#ifdef __cplusplus
} /* extern "C" */
#endif

#endif /* _CRYPTMOUNT_H */
