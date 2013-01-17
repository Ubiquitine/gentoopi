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

#ifndef WebKitDOMDOMPlugin_h
#define WebKitDOMDOMPlugin_h

#include "webkit/webkitdomdefines.h"
#include <glib-object.h>
#include <webkit/webkitdefines.h>
#include "webkit/WebKitDOMObject.h"


G_BEGIN_DECLS
#define WEBKIT_TYPE_DOM_DOM_PLUGIN            (webkit_dom_dom_plugin_get_type())
#define WEBKIT_DOM_DOM_PLUGIN(obj)            (G_TYPE_CHECK_INSTANCE_CAST((obj), WEBKIT_TYPE_DOM_DOM_PLUGIN, WebKitDOMDOMPlugin))
#define WEBKIT_DOM_DOM_PLUGIN_CLASS(klass)    (G_TYPE_CHECK_CLASS_CAST((klass),  WEBKIT_TYPE_DOM_DOM_PLUGIN, WebKitDOMDOMPluginClass)
#define WEBKIT_DOM_IS_DOM_PLUGIN(obj)         (G_TYPE_CHECK_INSTANCE_TYPE((obj), WEBKIT_TYPE_DOM_DOM_PLUGIN))
#define WEBKIT_DOM_IS_DOM_PLUGIN_CLASS(klass) (G_TYPE_CHECK_CLASS_TYPE((klass),  WEBKIT_TYPE_DOM_DOM_PLUGIN))
#define WEBKIT_DOM_DOM_PLUGIN_GET_CLASS(obj)  (G_TYPE_INSTANCE_GET_CLASS((obj),  WEBKIT_TYPE_DOM_DOM_PLUGIN, WebKitDOMDOMPluginClass))

struct _WebKitDOMDOMPlugin {
    WebKitDOMObject parent_instance;
};

struct _WebKitDOMDOMPluginClass {
    WebKitDOMObjectClass parent_class;
};

WEBKIT_API GType
webkit_dom_dom_plugin_get_type (void);

/**
 * webkit_dom_dom_plugin_item:
 * @self: A #WebKitDOMDOMPlugin
 * @index: A #gulong
 *
 * Returns: (transfer none):
 *
**/
WEBKIT_API WebKitDOMDOMMimeType*
webkit_dom_dom_plugin_item(WebKitDOMDOMPlugin* self, gulong index);

/**
 * webkit_dom_dom_plugin_named_item:
 * @self: A #WebKitDOMDOMPlugin
 * @name: A #gchar
 *
 * Returns: (transfer none):
 *
**/
WEBKIT_API WebKitDOMDOMMimeType*
webkit_dom_dom_plugin_named_item(WebKitDOMDOMPlugin* self, const gchar* name);

/**
 * webkit_dom_dom_plugin_get_name:
 * @self: A #WebKitDOMDOMPlugin
 *
 * Returns:
 *
**/
WEBKIT_API gchar*
webkit_dom_dom_plugin_get_name(WebKitDOMDOMPlugin* self);

/**
 * webkit_dom_dom_plugin_get_filename:
 * @self: A #WebKitDOMDOMPlugin
 *
 * Returns:
 *
**/
WEBKIT_API gchar*
webkit_dom_dom_plugin_get_filename(WebKitDOMDOMPlugin* self);

/**
 * webkit_dom_dom_plugin_get_description:
 * @self: A #WebKitDOMDOMPlugin
 *
 * Returns:
 *
**/
WEBKIT_API gchar*
webkit_dom_dom_plugin_get_description(WebKitDOMDOMPlugin* self);

/**
 * webkit_dom_dom_plugin_get_length:
 * @self: A #WebKitDOMDOMPlugin
 *
 * Returns:
 *
**/
WEBKIT_API gulong
webkit_dom_dom_plugin_get_length(WebKitDOMDOMPlugin* self);

G_END_DECLS

#endif /* WebKitDOMDOMPlugin_h */