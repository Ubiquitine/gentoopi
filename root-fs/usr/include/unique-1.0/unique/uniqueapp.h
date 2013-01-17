/* Unique - Single Instance Backendlication library
 * uniqueapp.h: Base class for single instance applications
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

#ifndef __UNIQUE_APP_H__
#define __UNIQUE_APP_H__

#include <glib-object.h>
#include <unique/uniquemessage.h>
#include <gtk/gtk.h>

G_BEGIN_DECLS

#define UNIQUE_TYPE_APP                 (unique_app_get_type ())
#define UNIQUE_APP(obj)                 (G_TYPE_CHECK_INSTANCE_CAST ((obj), UNIQUE_TYPE_APP, UniqueApp))
#define UNIQUE_IS_APP(obj)              (G_TYPE_CHECK_INSTANCE_TYPE ((obj), UNIQUE_TYPE_APP))
#define UNIQUE_APP_CLASS(klass)         (G_TYPE_CHECK_CLASS_CAST ((klass), UNIQUE_TYPE_APP, UniqueAppClass))
#define UNIQUE_IS_APP_CLASS(klass)      (G_TYPE_CHECK_CLASS_TYPE ((klass), UNIQUE_TYPE_APP))
#define UNIQUE_APP_GET_CLASS(obj)       (G_TYPE_INSTANCE_GET_CLASS ((obj), UNIQUE_TYPE_APP, UniqueAppClass))

/**
 * UniqueCommand:
 * @UNIQUE_INVALID: used internally
 * @UNIQUE_ACTIVATE: request to activate a currently active instance; this
 *   usually means calling gtk_window_present() on the application window.
 * @UNIQUE_NEW: request to create a new file.
 * @UNIQUE_OPEN: request to open a file.
 * @UNIQUE_CLOSE: requests to close the currently running instance.
 *
 * Command to send to a currently active instance. User defined commands
 * should be positive integers, and should be added using the
 * unique_app_add_command() function after creating a #UniqueApp instance
 */
typedef enum { /*< prefix=UNIQUE >*/
  UNIQUE_INVALID  = 0,
  UNIQUE_ACTIVATE = -1,
  UNIQUE_NEW      = -2,
  UNIQUE_OPEN     = -3,
  UNIQUE_CLOSE    = -4
} UniqueCommand;

/**
 * UniqueResponse:
 * @UNIQUE_RESPONSE_INVALID: Internal error code, should never be used.
 * @UNIQUE_RESPONSE_OK: The command was successfully executed.
 * @UNIQUE_RESPONSE_CANCEL: The command was cancelled by the user.
 * @UNIQUE_RESPONSE_FAIL: The command failed due to a IPC failure.
 * @UNIQUE_RESPONSE_PASSTHROUGH: The command was not handled
 *
 * Response that a currently active instance of the application should
 * return to the caller which sent a command.
 */
typedef enum { /*< prefix=UNIQUE_RESPONSE >*/
  UNIQUE_RESPONSE_INVALID = 0,
  UNIQUE_RESPONSE_OK,
  UNIQUE_RESPONSE_CANCEL,
  UNIQUE_RESPONSE_FAIL,
  UNIQUE_RESPONSE_PASSTHROUGH
} UniqueResponse;

typedef struct _UniqueApp               UniqueApp;
typedef struct _UniqueAppPrivate        UniqueAppPrivate;
typedef struct _UniqueAppClass          UniqueAppClass;

/**
 * UniqueApp:
 *
 * The base class for every single instance application. The #UniqueApp
 * structure contains only private data and should be manipulated only
 * with the provided functions.
 */
struct _UniqueApp
{
  /*< private >*/
  GObject parent_instance;

  UniqueAppPrivate *priv;
};

/**
 * UniqueAppClass:
 * @message_received: Signal class closure for the UniqueApp::message_received
 *   signal.
 *
 * Base class for every single instance application.
 */
struct _UniqueAppClass
{
  /*< private >*/
  GObjectClass parent_class;

  /*< public >*/
  UniqueResponse (* message_received) (UniqueApp         *app,
                                       gint               command,
                                       UniqueMessageData *message_data,
                                       guint              time_);
  
  /*< private >*/
  /* padding */
  void (*_unique_reserved1) (void);
  void (*_unique_reserved2) (void);
  void (*_unique_reserved3) (void);
  void (*_unique_reserved4) (void);
};

GType          unique_app_get_type            (void) G_GNUC_CONST;

UniqueApp *    unique_app_new                 (const gchar       *name,
                                               const gchar       *startup_id);
UniqueApp *    unique_app_new_with_commands   (const gchar       *name,
                                               const gchar       *startup_id,
                                               const gchar       *first_command_name,
                                               ...) G_GNUC_NULL_TERMINATED;
void           unique_app_add_command         (UniqueApp         *app,
                                               const gchar       *command_name,
                                               gint               command_id);
void           unique_app_watch_window        (UniqueApp         *app,
                                               GtkWindow         *window);

gboolean       unique_app_is_running          (UniqueApp         *app);
UniqueResponse unique_app_send_message        (UniqueApp         *app,
                                               gint               command_id,
                                               UniqueMessageData *message_data);

G_END_DECLS

#endif /* __UNIQUE_APP_H__ */
