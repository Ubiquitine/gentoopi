#ifndef _LINUX_STDDEF_H
#define _LINUX_STDDEF_H




#include <stddef.h> /* newer gcc includes this */
#ifndef offsetof
#define offsetof(TYPE, MEMBER) ((size_t) &((TYPE *)0)->MEMBER)
#endif

#endif
