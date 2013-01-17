/*
    This file is part of the WebKit open source project.
    This file has been generated by generate-bindings.pl. DO NOT MODIFY!

    This library is free software; you can redistribute it and/or
    modify it under the terms of the GNU Library General Public
    License as published by the Free Software Foundation; either
    version 2 of the License, or (at your option) any later version.

    This library is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
    Library General Public License for more details.

    You should have received a copy of the GNU Library General Public License
    along with this library; see the file COPYING.LIB.  If not, write to
    the Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
    Boston, MA 02110-1301, USA.
*/

#ifndef WebKitDOMRange_h
#define WebKitDOMRange_h

#include "webkit/webkitdomdefines.h"
#include <glib-object.h>
#include <webkit/webkitdefines.h>
#include "webkit/WebKitDOMObject.h"


G_BEGIN_DECLS
#define WEBKIT_TYPE_DOM_RANGE            (webkit_dom_range_get_type())
#define WEBKIT_DOM_RANGE(obj)            (G_TYPE_CHECK_INSTANCE_CAST((obj), WEBKIT_TYPE_DOM_RANGE, WebKitDOMRange))
#define WEBKIT_DOM_RANGE_CLASS(klass)    (G_TYPE_CHECK_CLASS_CAST((klass),  WEBKIT_TYPE_DOM_RANGE, WebKitDOMRangeClass)
#define WEBKIT_DOM_IS_RANGE(obj)         (G_TYPE_CHECK_INSTANCE_TYPE((obj), WEBKIT_TYPE_DOM_RANGE))
#define WEBKIT_DOM_IS_RANGE_CLASS(klass) (G_TYPE_CHECK_CLASS_TYPE((klass),  WEBKIT_TYPE_DOM_RANGE))
#define WEBKIT_DOM_RANGE_GET_CLASS(obj)  (G_TYPE_INSTANCE_GET_CLASS((obj),  WEBKIT_TYPE_DOM_RANGE, WebKitDOMRangeClass))

struct _WebKitDOMRange {
    WebKitDOMObject parent_instance;
};

struct _WebKitDOMRangeClass {
    WebKitDOMObjectClass parent_class;
};

WEBKIT_API GType
webkit_dom_range_get_type (void);

/**
 * webkit_dom_range_set_start:
 * @self: A #WebKitDOMRange
 * @ref_node: A #WebKitDOMNode
 * @offset: A #glong
 * @error: #GError
 *
 * Returns:
 *
**/
WEBKIT_API void
webkit_dom_range_set_start(WebKitDOMRange* self, WebKitDOMNode* ref_node, glong offset, GError **error);

/**
 * webkit_dom_range_set_end:
 * @self: A #WebKitDOMRange
 * @ref_node: A #WebKitDOMNode
 * @offset: A #glong
 * @error: #GError
 *
 * Returns:
 *
**/
WEBKIT_API void
webkit_dom_range_set_end(WebKitDOMRange* self, WebKitDOMNode* ref_node, glong offset, GError **error);

/**
 * webkit_dom_range_set_start_before:
 * @self: A #WebKitDOMRange
 * @ref_node: A #WebKitDOMNode
 * @error: #GError
 *
 * Returns:
 *
**/
WEBKIT_API void
webkit_dom_range_set_start_before(WebKitDOMRange* self, WebKitDOMNode* ref_node, GError **error);

/**
 * webkit_dom_range_set_start_after:
 * @self: A #WebKitDOMRange
 * @ref_node: A #WebKitDOMNode
 * @error: #GError
 *
 * Returns:
 *
**/
WEBKIT_API void
webkit_dom_range_set_start_after(WebKitDOMRange* self, WebKitDOMNode* ref_node, GError **error);

/**
 * webkit_dom_range_set_end_before:
 * @self: A #WebKitDOMRange
 * @ref_node: A #WebKitDOMNode
 * @error: #GError
 *
 * Returns:
 *
**/
WEBKIT_API void
webkit_dom_range_set_end_before(WebKitDOMRange* self, WebKitDOMNode* ref_node, GError **error);

/**
 * webkit_dom_range_set_end_after:
 * @self: A #WebKitDOMRange
 * @ref_node: A #WebKitDOMNode
 * @error: #GError
 *
 * Returns:
 *
**/
WEBKIT_API void
webkit_dom_range_set_end_after(WebKitDOMRange* self, WebKitDOMNode* ref_node, GError **error);

/**
 * webkit_dom_range_collapse:
 * @self: A #WebKitDOMRange
 * @to_start: A #gboolean
 * @error: #GError
 *
 * Returns:
 *
**/
WEBKIT_API void
webkit_dom_range_collapse(WebKitDOMRange* self, gboolean to_start, GError **error);

/**
 * webkit_dom_range_select_node:
 * @self: A #WebKitDOMRange
 * @ref_node: A #WebKitDOMNode
 * @error: #GError
 *
 * Returns:
 *
**/
WEBKIT_API void
webkit_dom_range_select_node(WebKitDOMRange* self, WebKitDOMNode* ref_node, GError **error);

/**
 * webkit_dom_range_select_node_contents:
 * @self: A #WebKitDOMRange
 * @ref_node: A #WebKitDOMNode
 * @error: #GError
 *
 * Returns:
 *
**/
WEBKIT_API void
webkit_dom_range_select_node_contents(WebKitDOMRange* self, WebKitDOMNode* ref_node, GError **error);

/**
 * webkit_dom_range_compare_boundary_points:
 * @self: A #WebKitDOMRange
 * @how: A #gushort
 * @source_range: A #WebKitDOMRange
 * @error: #GError
 *
 * Returns:
 *
**/
WEBKIT_API gshort
webkit_dom_range_compare_boundary_points(WebKitDOMRange* self, gushort how, WebKitDOMRange* source_range, GError **error);

/**
 * webkit_dom_range_delete_contents:
 * @self: A #WebKitDOMRange
 * @error: #GError
 *
 * Returns:
 *
**/
WEBKIT_API void
webkit_dom_range_delete_contents(WebKitDOMRange* self, GError **error);

/**
 * webkit_dom_range_extract_contents:
 * @self: A #WebKitDOMRange
 * @error: #GError
 *
 * Returns: (transfer none):
 *
**/
WEBKIT_API WebKitDOMDocumentFragment*
webkit_dom_range_extract_contents(WebKitDOMRange* self, GError **error);

/**
 * webkit_dom_range_clone_contents:
 * @self: A #WebKitDOMRange
 * @error: #GError
 *
 * Returns: (transfer none):
 *
**/
WEBKIT_API WebKitDOMDocumentFragment*
webkit_dom_range_clone_contents(WebKitDOMRange* self, GError **error);

/**
 * webkit_dom_range_insert_node:
 * @self: A #WebKitDOMRange
 * @new_node: A #WebKitDOMNode
 * @error: #GError
 *
 * Returns:
 *
**/
WEBKIT_API void
webkit_dom_range_insert_node(WebKitDOMRange* self, WebKitDOMNode* new_node, GError **error);

/**
 * webkit_dom_range_surround_contents:
 * @self: A #WebKitDOMRange
 * @new_parent: A #WebKitDOMNode
 * @error: #GError
 *
 * Returns:
 *
**/
WEBKIT_API void
webkit_dom_range_surround_contents(WebKitDOMRange* self, WebKitDOMNode* new_parent, GError **error);

/**
 * webkit_dom_range_clone_range:
 * @self: A #WebKitDOMRange
 * @error: #GError
 *
 * Returns: (transfer none):
 *
**/
WEBKIT_API WebKitDOMRange*
webkit_dom_range_clone_range(WebKitDOMRange* self, GError **error);

/**
 * webkit_dom_range_to_string:
 * @self: A #WebKitDOMRange
 * @error: #GError
 *
 * Returns:
 *
**/
WEBKIT_API gchar*
webkit_dom_range_to_string(WebKitDOMRange* self, GError **error);

/**
 * webkit_dom_range_detach:
 * @self: A #WebKitDOMRange
 * @error: #GError
 *
 * Returns:
 *
**/
WEBKIT_API void
webkit_dom_range_detach(WebKitDOMRange* self, GError **error);

/**
 * webkit_dom_range_create_contextual_fragment:
 * @self: A #WebKitDOMRange
 * @html: A #gchar
 * @error: #GError
 *
 * Returns: (transfer none):
 *
**/
WEBKIT_API WebKitDOMDocumentFragment*
webkit_dom_range_create_contextual_fragment(WebKitDOMRange* self, const gchar* html, GError **error);

/**
 * webkit_dom_range_intersects_node:
 * @self: A #WebKitDOMRange
 * @ref_node: A #WebKitDOMNode
 * @error: #GError
 *
 * Returns:
 *
**/
WEBKIT_API gboolean
webkit_dom_range_intersects_node(WebKitDOMRange* self, WebKitDOMNode* ref_node, GError **error);

/**
 * webkit_dom_range_compare_node:
 * @self: A #WebKitDOMRange
 * @ref_node: A #WebKitDOMNode
 * @error: #GError
 *
 * Returns:
 *
**/
WEBKIT_API gshort
webkit_dom_range_compare_node(WebKitDOMRange* self, WebKitDOMNode* ref_node, GError **error);

/**
 * webkit_dom_range_compare_point:
 * @self: A #WebKitDOMRange
 * @ref_node: A #WebKitDOMNode
 * @offset: A #glong
 * @error: #GError
 *
 * Returns:
 *
**/
WEBKIT_API gshort
webkit_dom_range_compare_point(WebKitDOMRange* self, WebKitDOMNode* ref_node, glong offset, GError **error);

/**
 * webkit_dom_range_is_point_in_range:
 * @self: A #WebKitDOMRange
 * @ref_node: A #WebKitDOMNode
 * @offset: A #glong
 * @error: #GError
 *
 * Returns:
 *
**/
WEBKIT_API gboolean
webkit_dom_range_is_point_in_range(WebKitDOMRange* self, WebKitDOMNode* ref_node, glong offset, GError **error);

/**
 * webkit_dom_range_expand:
 * @self: A #WebKitDOMRange
 * @unit: A #gchar
 * @error: #GError
 *
 * Returns:
 *
**/
WEBKIT_API void
webkit_dom_range_expand(WebKitDOMRange* self, const gchar* unit, GError **error);

/**
 * webkit_dom_range_get_start_container:
 * @self: A #WebKitDOMRange
 * @error: #GError
 *
 * Returns: (transfer none):
 *
**/
WEBKIT_API WebKitDOMNode*
webkit_dom_range_get_start_container(WebKitDOMRange* self, GError **error);

/**
 * webkit_dom_range_get_start_offset:
 * @self: A #WebKitDOMRange
 * @error: #GError
 *
 * Returns:
 *
**/
WEBKIT_API glong
webkit_dom_range_get_start_offset(WebKitDOMRange* self, GError **error);

/**
 * webkit_dom_range_get_end_container:
 * @self: A #WebKitDOMRange
 * @error: #GError
 *
 * Returns: (transfer none):
 *
**/
WEBKIT_API WebKitDOMNode*
webkit_dom_range_get_end_container(WebKitDOMRange* self, GError **error);

/**
 * webkit_dom_range_get_end_offset:
 * @self: A #WebKitDOMRange
 * @error: #GError
 *
 * Returns:
 *
**/
WEBKIT_API glong
webkit_dom_range_get_end_offset(WebKitDOMRange* self, GError **error);

/**
 * webkit_dom_range_get_collapsed:
 * @self: A #WebKitDOMRange
 * @error: #GError
 *
 * Returns:
 *
**/
WEBKIT_API gboolean
webkit_dom_range_get_collapsed(WebKitDOMRange* self, GError **error);

/**
 * webkit_dom_range_get_common_ancestor_container:
 * @self: A #WebKitDOMRange
 * @error: #GError
 *
 * Returns: (transfer none):
 *
**/
WEBKIT_API WebKitDOMNode*
webkit_dom_range_get_common_ancestor_container(WebKitDOMRange* self, GError **error);

/**
 * webkit_dom_range_get_text:
 * @self: A #WebKitDOMRange
 *
 * Returns:
 *
**/
WEBKIT_API gchar*
webkit_dom_range_get_text(WebKitDOMRange* self);

G_END_DECLS

#endif /* WebKitDOMRange_h */