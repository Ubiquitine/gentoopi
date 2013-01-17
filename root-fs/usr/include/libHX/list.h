#ifndef _LIBHX_LIST_H
#define _LIBHX_LIST_H 1

#ifdef __cplusplus
#	include <cstddef>
#else
#	include <stdbool.h>
#	include <stddef.h>
#endif
#include <libHX/defs.h>

#ifdef __cplusplus
extern "C" {
#endif

#define HXlist_entry(ptr, type, member) containerof((ptr), type, member)

struct HXlist_head {
	struct HXlist_head *next, *prev;
};

#define HXLIST_HEAD_INIT(name) {&(name), &(name)}
#define HXLIST_HEAD(name) \
	struct HXlist_head name = HXLIST_HEAD_INIT(name)

static __inline__ void HXlist_init(struct HXlist_head *list)
{
	list->next = list->prev = list;
}

static __inline__ void __HXlist_add(struct HXlist_head *nu,
    struct HXlist_head *prev, struct HXlist_head *next)
{
	nu->next = next;
	nu->prev = prev;
	next->prev = nu;
	prev->next = nu;
}

static __inline__ void
HXlist_add(struct HXlist_head *head, struct HXlist_head *entry)
{
	__HXlist_add(entry, head, head->next);
}

static __inline__ void
HXlist_add_tail(struct HXlist_head *head, struct HXlist_head *entry)
{
	__HXlist_add(entry, head->prev, head);
}

static __inline__ void HXlist_del(struct HXlist_head *entry)
{
	entry->prev->next = entry->next;
	entry->next->prev = entry->prev;
	entry->next = NULL;
	entry->prev = NULL;
}

static __inline__ bool HXlist_empty(const struct HXlist_head *head)
{
	return head->next == head;
}

#define HXlist_for_each(pos, head) \
	for ((pos) = (head)->next; (pos) != (void *)(head); \
	     (pos) = (pos)->next)

#define HXlist_for_each_rev(pos, head) \
	for ((pos) = (head)->prev; (pos) != (void *)(head); \
	     (pos) = (pos)->prev)

#define HXlist_for_each_safe(pos, n, head) \
	for ((pos) = (head)->next, (n) = (pos)->next; (pos) != (void *)(head); \
	     (pos) = (n), (n) = (pos)->next)

#define HXlist_for_each_rev_safe(pos, n, head) \
	for ((pos) = (head)->prev, (n) = (pos)->prev; (pos) != (void *)(head); \
	     (pos) = (n), (n) = (pos)->prev)

#define HXlist_for_each_entry(pos, head, member) \
	for ((pos) = HXlist_entry((head)->next, __typeof__(*(pos)), member); \
	     &(pos)->member != (void *)(head); \
	     (pos) = HXlist_entry((pos)->member.next, __typeof__(*(pos)), member))

#define HXlist_for_each_entry_rev(pos, head, member) \
	for ((pos) = HXlist_entry((head)->prev, __typeof__(*(pos)), member); \
	     &(pos)->member != (void *)(head); \
	     (pos) = HXlist_entry((pos)->member.prev, __typeof__(*(pos)), member))

#define HXlist_for_each_entry_safe(pos, n, head, member) \
	for ((pos) = HXlist_entry((head)->next, __typeof__(*(pos)), member), \
	     (n) = HXlist_entry((pos)->member.next, __typeof__(*(pos)), member); \
	     &(pos)->member != (void *)(head); \
	     (pos) = (n), (n) = HXlist_entry((n)->member.next, __typeof__(*(n)), \
	     member))

struct HXclist_head {
	union {
		struct HXlist_head list;
		struct {
			struct HXlist_head *next, *prev;
		};
	};
	unsigned int items;
};

#define HXCLIST_HEAD_INIT(name) {{{&(name).list, &(name).list}}, 0}
#define HXCLIST_HEAD(name) \
	struct HXclist_head name = HXCLIST_HEAD_INIT(name)

static __inline__ void HXclist_init(struct HXclist_head *head)
{
	head->list.next = head->list.prev = &head->list;
	head->items = 0;
}

static __inline__ void
HXclist_del(struct HXclist_head *head, struct HXlist_head *node)
{
	--head->items;
	HXlist_del(node);
}

static __inline__ void
HXclist_unshift(struct HXclist_head *head, struct HXlist_head *nu)
{
	++head->items;
	__HXlist_add(nu, &head->list, head->list.next);
}

static __inline__ void
HXclist_push(struct HXclist_head *head, struct HXlist_head *nu)
{
	++head->items;
	__HXlist_add(nu, head->list.prev, &head->list);
}

static __inline__ struct HXlist_head *__HXclist_pop(struct HXclist_head *head)
{
	struct HXlist_head *p;
	if ((const void *)head == head->list.next)
		return NULL;
	p = head->list.prev;
	HXlist_del(p);
	--head->items;
	return p;
}

#define HXclist_pop(head, type, member) \
	HXlist_entry(__HXclist_pop(head), type, member)

static __inline__ struct HXlist_head *
__HXclist_shift(struct HXclist_head *head)
{
	struct HXlist_head *p;
	if ((const void *)head == head->list.next)
		return NULL;
	p = head->list.next;
	HXlist_del(p);
	--head->items;
	return p;
}

#define HXclist_shift(head, type, member) \
	HXlist_entry(__HXclist_shift(head), type, member)

#ifdef __cplusplus
} /* extern "C" */
#endif

#endif /* _LIBHX_LIST_H */
