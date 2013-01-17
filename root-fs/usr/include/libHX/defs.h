#ifndef _LIBHX_DEFS_H
#define _LIBHX_DEFS_H 1

#ifdef __cplusplus
#	define HXsizeof_member(type, member) \
		sizeof(static_cast<type *>(NULL)->member)
#	define HXtypeof_member(type, member) \
		__typeof__(static_cast<type *>(NULL)->member)
#	if defined(__GNUC__) && __GNUC__ >= 4 && !defined(offsetof)
		/*
		 * This is here so most programs can skip inclusion
		 * of stddef.h just to get offsetof.
		 */
#		define offsetof(type, member) __builtin_offsetof(type, member)
#	endif
#	ifndef offsetof
#		define offsetof(type, member) \
			reinterpret_cast<long>(&(static_cast<type *>(NULL)->member))
#	endif
#	ifndef containerof
#		define containerof(var, type, member) reinterpret_cast<type *>( \
			reinterpret_cast<char *>(var) - offsetof(type, member))
#	endif

template<typename new_type>
static __inline__ new_type signed_cast(const char *expr)
{
	return reinterpret_cast<new_type>(expr);
}

template<typename new_type>
static __inline__ new_type signed_cast(const signed char *expr)
{
	return reinterpret_cast<new_type>(expr);
}

template<typename new_type>
static __inline__ new_type signed_cast(const unsigned char *expr)
{
	return reinterpret_cast<new_type>(expr);
}

template<typename new_type>
static __inline__ new_type signed_cast(char *expr)
{
	return reinterpret_cast<new_type>(expr);
}

template<typename new_type>
static __inline__ new_type signed_cast(signed char *expr)
{
	return reinterpret_cast<new_type>(expr);
}

template<typename new_type>
static __inline__ new_type signed_cast(unsigned char *expr)
{
	return reinterpret_cast<new_type>(expr);
}
#else
#	define HXsizeof_member(type, member) sizeof(((type *)NULL)->member)
#	define HXtypeof_member(type, member) __typeof__(((type *)NULL)->member)
	/* N.B. signed_cast<> does not exist in C++. */
#	define __signed_cast_compatible(a, b) \
		__builtin_choose_expr( \
			__builtin_types_compatible_p(b, const char *) || \
			__builtin_types_compatible_p(b, const signed char *) || \
			__builtin_types_compatible_p(b, const unsigned char *), \
			/* if src has a const qualifier */ \
			__builtin_types_compatible_p(a, const char *) || \
			__builtin_types_compatible_p(a, const signed char *) || \
			__builtin_types_compatible_p(a, const unsigned char *), \
			/* and if it has none... */ \
			__builtin_types_compatible_p(a, const char *) || \
			__builtin_types_compatible_p(a, const signed char *) || \
			__builtin_types_compatible_p(a, const unsigned char *) || \
			__builtin_types_compatible_p(a, char *) || \
			__builtin_types_compatible_p(a, signed char *) || \
			__builtin_types_compatible_p(a, unsigned char *) \
		)

#	if defined(__GNUC__) && !defined(__clang__) && !defined(signed_cast)
#		define signed_cast(type, expr) ({ \
			BUILD_BUG_ON(!__signed_cast_compatible(__typeof__(type), __typeof__(expr))); \
			(type)(expr); \
		})
#	endif
#	if defined(__GNUC__) && !defined(__clang__) && !defined(static_cast)
#		define static_cast(type, expr) \
			((struct { type x; }){(expr)}.x)
#	endif
#	if defined(__GNUC__) && !defined(__clang__) && !defined(const_cast1)
#		define __const_cast_strip1(expr) \
			__typeof__(*(union { int z; __typeof__(expr) x; }){0}.x)
#		define __const_cast_strip2(expr) \
			__typeof__(**(union { int z; __typeof__(expr) x; }){0}.x)
#		define __const_cast_strip3(expr) \
			__typeof__(***(union { int z; __typeof__(expr) x; }){0}.x)
#		define const_cast1(new_type, expr) ({ \
			BUILD_BUG_ON(!__builtin_types_compatible_p(__const_cast_strip1(expr), __const_cast_strip1(new_type))); \
			(new_type)(expr); \
		})
#		define const_cast2(new_type, expr) ({ \
			BUILD_BUG_ON(!__builtin_types_compatible_p(__const_cast_strip2(expr), __const_cast_strip2(new_type))); \
			(new_type)(expr); \
		})
#		define const_cast3(new_type, expr) ({ \
			BUILD_BUG_ON(!__builtin_types_compatible_p(__const_cast_strip3(expr), __const_cast_strip3(new_type))); \
			(new_type)(expr); \
		})
#	endif
#	ifndef signed_cast
#		define signed_cast(type, expr)      ((type)(expr))
#	endif
#	ifndef static_cast
#		define static_cast(type, expr)      ((type)(expr))
#	endif
#	ifndef const_cast
#		define const_cast(type, expr)       ((type)(expr))
#	endif
#	ifndef const_cast1
#		define const_cast1(type, expr)      ((type)(expr))
#		define const_cast2(type, expr)      ((type)(expr))
#		define const_cast3(type, expr)      ((type)(expr))
#	endif
#	ifndef reinterpret_cast
#		define reinterpret_cast(type, expr) ((type)(expr))
#	endif
#	if defined(__GNUC__) && __GNUC__ >= 4 && !defined(offsetof)
#		define offsetof(type, member) __builtin_offsetof(type, member)
#	endif
#	ifndef offsetof
#		define offsetof(type, member) \
			reinterpret_cast(long, &(static_cast(type *, NULL)->member))
#	endif
#	ifndef containerof
#		define containerof(var, type, member) reinterpret_cast(type *, \
			reinterpret_cast(char *, var) - offsetof(type, member))
#	endif
#endif

#if defined(__GNUC__) && !defined(__cplusplus)
	/*
	 * If typeof @a stays the same through a demotion to pointer,
	 * @a cannot be an array.
	 */
#	define __array_size_check(a) BUILD_BUG_ON_EXPR(\
		__builtin_types_compatible_p(__typeof__(a), \
		__typeof__(DEMOTE_TO_PTR(a))))
#else
#	define __array_size_check(a) 0
#endif
#ifndef ARRAY_SIZE
#	define ARRAY_SIZE(x) (sizeof(x) / sizeof(*(x)) + __array_size_check(x))
#endif
#ifndef BUILD_BUG_ON_EXPR
#	define BUILD_BUG_ON_EXPR(condition) (sizeof(char[1 - 2 * !!(condition)]) - 1)
#endif
#ifndef BUILD_BUG_ON
#	define BUILD_BUG_ON(condition) ((void)BUILD_BUG_ON_EXPR(condition))
#endif
#ifndef DEMOTE_TO_PTR
	/*
	 * An alternative approach is also (p+0), but that does not ensure that
	 * @p is a pointer. Since functions "support" infinite dereferencing,
	 * "&*" also works on them.
	 */
#	define DEMOTE_TO_PTR(p) (&*(p))
#endif
#ifndef O_BINARY
#	define O_BINARY 0
#endif
#ifndef S_IRUGO
#	define S_IRUGO (S_IRUSR | S_IRGRP | S_IROTH)
#endif
#ifndef S_IWUGO
#	define S_IWUGO (S_IWUSR | S_IWGRP | S_IWOTH)
#endif
#ifndef S_IXUGO
#	define S_IXUGO (S_IXUSR | S_IXGRP | S_IXOTH)
#endif
#ifndef S_IRWXUGO
#	define S_IRWXUGO (S_IRUGO | S_IWUGO | S_IXUGO)
#endif

#define HXSIZEOF_Z16 sizeof("-65536")
/* 2^32 and -2^31 have differing length */
#define HXSIZEOF_Z32 sizeof("-4294967296")
/* 2^64 and -2^63 have same length */
#define HXSIZEOF_Z64 sizeof("18446744073709551616")

#define __HX_STRINGIFY_EXPAND(s) #s
#define HX_STRINGIFY(s) __HX_STRINGIFY_EXPAND(s)

#endif /* _LIBHX_DEFS_H */
