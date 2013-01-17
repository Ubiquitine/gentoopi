


#if !defined(__WEBKIT2_H_INSIDE__) && !defined(WEBKIT2_COMPILATION)
#error "Only <webkit2/webkit2.h> can be included directly."
#endif

#ifndef WEBKIT_ENUM_TYPES_H
#define WEBKIT_ENUM_TYPES_H

#include <glib-object.h>

#include <webkit2/WebKitDefines.h>

G_BEGIN_DECLS

#include <webkit2/WebKitError.h>

#define WEBKIT_TYPE_NETWORK_ERROR webkit_network_error_get_type()

WEBKIT_API GType
webkit_network_error_get_type(void);

#define WEBKIT_TYPE_POLICY_ERROR webkit_policy_error_get_type()

WEBKIT_API GType
webkit_policy_error_get_type(void);

#define WEBKIT_TYPE_PLUGIN_ERROR webkit_plugin_error_get_type()

WEBKIT_API GType
webkit_plugin_error_get_type(void);

#define WEBKIT_TYPE_DOWNLOAD_ERROR webkit_download_error_get_type()

WEBKIT_API GType
webkit_download_error_get_type(void);

#include <webkit2/WebKitFindController.h>

#define WEBKIT_TYPE_FIND_OPTIONS webkit_find_options_get_type()

WEBKIT_API GType
webkit_find_options_get_type(void);

#include <webkit2/WebKitHitTestResult.h>

#define WEBKIT_TYPE_HIT_TEST_RESULT_CONTEXT webkit_hit_test_result_context_get_type()

WEBKIT_API GType
webkit_hit_test_result_context_get_type(void);

#include <webkit2/WebKitNavigationPolicyDecision.h>

#define WEBKIT_TYPE_NAVIGATION_TYPE webkit_navigation_type_get_type()

WEBKIT_API GType
webkit_navigation_type_get_type(void);

#include <webkit2/WebKitPrintOperation.h>

#define WEBKIT_TYPE_PRINT_OPERATION_RESPONSE webkit_print_operation_response_get_type()

WEBKIT_API GType
webkit_print_operation_response_get_type(void);

#include <webkit2/WebKitWebContext.h>

#define WEBKIT_TYPE_CACHE_MODEL webkit_cache_model_get_type()

WEBKIT_API GType
webkit_cache_model_get_type(void);

#include <webkit2/WebKitWebView.h>

#define WEBKIT_TYPE_POLICY_DECISION_TYPE webkit_policy_decision_type_get_type()

WEBKIT_API GType
webkit_policy_decision_type_get_type(void);

#define WEBKIT_TYPE_LOAD_EVENT webkit_load_event_get_type()

WEBKIT_API GType
webkit_load_event_get_type(void);

G_END_DECLS

#endif



