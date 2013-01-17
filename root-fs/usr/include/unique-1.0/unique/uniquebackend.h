/* Unique - Single Instance Backendlication library
 * uniquebackend.h: Base class for IPC transports
 *
 * Copyright (C) 2007  Emmanuele Bassi  <ebassi@o-hand.com>
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
 * 02110-1301 USA
 */

#ifndef __UNIQUE_BACKEND_H__
#define __UNIQUE_BACKEND_H__

#include <glib-object.h>
#include <gdk/gdk.h>
#include <unique/uniqueapp.h>

G_BEGIN_DECLS

#define UNIQUE_TYPE_BACKEND             (unique_backend_get_type ())
#define UNIQUE_BACKEND(obj)             (G_TYPE_CHECK_INSTANCE_CAST ((obj), UNIQUE_TYPE_BACKEND, UniqueBackend))
#define UNIQUE_IS_BACKEND(obj)          (G_TYPE_CHECK_INSTANCE_TYPE ((obj), UNIQUE_TYPE_BACKEND))
#define UNIQUE_BACKEND_CLASS(klass)     (G_TYPE_CHECK_CLASS_CAST ((klass), UNIQUE_TYPE_BACKEND, UniqueBackendClass))
#define UNIQUE_IS_BACKEND_CLASS(klass)  (G_TYPE_CHECK_CLASS_TYPE ((klass), UNIQUE_TYPE_BACKEND))
#define UNIQUE_BACKEND_GET_CLASS(obj)   (G_TYPE_INSTANCE_GET_CLASS ((obj), UNIQUE_TYPE_BACKEND, UniqueBackendClass))

typedef struct _UniqueBackend           UniqueBackend;
typedef struct _UniqueBackendClass      UniqueBackendClass;

/**
 * UniqueBackend:
 *
 * The #UniqueBackend structure contains only private data and should only
 * be accessed using the provided functions.
 */
struct _UniqueBackend
{
  GObject parent_instance;

  /*< private >*/
  UniqueApp *parent;

  gchar *name;
  gchar *startup_id;

  GdkScreen *screen;
  guint workspace;
};

/**
 * UniqueBackendClass:
 * @request_name: This method should be used to request the name for the
 *   instance set using unique_backend_set_name()
 * @send_message: This method should be used to send a message to a running
 *   instance
 *
 * The class that should be implemented by every backend for #UniqueApp.
 */
struct _UniqueBackendClass
{
  /*< private >*/
  GObjectClass parent_instance;

  /*< public >*/
  /* vtable, not signals */
  gboolean       (* request_name) (UniqueBackend     *backend);
  UniqueResponse (* send_message) (UniqueBackend     *backend,
                                   gint               command_id,
                                   UniqueMessageData *message_data,
                                   guint              time_);

  /*< private >*/
  /* padding for future expansion */
  void (*_unique_reserved1) (void);
  void (*_unique_reserved2) (void);
  void (*_unique_reserved3) (void);
  void (*_unique_reserved4) (void);
  void (*_unique_reserved5) (void);
  void (*_unique_reserved6) (void);
};

GType                 unique_backend_get_type       (void) G_GNUC_CONST;

UniqueBackend *       unique_backend_create         (void);

const gchar *         unique_backend_get_name       (UniqueBackend     *backend);
void                  unique_backend_set_name       (UniqueBackend     *backend,
                                                     const gchar       *name);
const gchar *         unique_backend_get_startup_id (UniqueBackend     *backend);
void                  unique_backend_set_startup_id (UniqueBackend     *backend,
                                                     const gchar       *startup_id);
GdkScreen *           unique_backend_get_screen     (UniqueBackend     *backend);
void                  unique_backend_set_screen     (UniqueBackend     *backend,
                                                     GdkScreen         *screen);
guint                 unique_backend_get_workspace  (UniqueBackend     *backend);

gboolean              unique_backend_request_name   (UniqueBackend     *backend);
UniqueResponse        unique_backend_send_message   (UniqueBackend     *backend,
                                                     gint               command_id,
                                                     UniqueMessageData *message_data,
                                                     guint              time_);

G_END_DECLS

#endif /* __UNIQUE_BACKEND_H__ */
