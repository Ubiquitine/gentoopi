/* Unique - Single Instance Backendlication library
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

#ifndef __UNIQUE_VERSION_H__
#define __UNIQUE_VERSION_H__

/**
 * SECTION:unique-version
 * @short_description: Version utilities
 *
 * Unique provides a set of macros to check the version of the library
 * and allow compile-time guards around new features.
 */

/**
 * UNIQUE_MAJOR_VERSION:
 *
 * Major version of Unique
 */
#define UNIQUE_MAJOR_VERSION            (1)

/**
 * UNIQUE_MINOR_VERSION:
 *
 * Minor version of Unique
 */
#define UNIQUE_MINOR_VERSION            (1)

/**
 * UNIQUE_MICRO_VERSION:
 *
 * Micro version of Unique
 */
#define UNIQUE_MICRO_VERSION            (6)

/**
 * UNIQUE_VERSION_S:
 *
 * Unique version as a string
 */
#define UNIQUE_VERSION_S                "1.1.6"

/**
 * UNIQUE_VERSION_HEX:
 *
 * Unique version as an hexadecimal integer
 */
#define UNIQUE_VERSION_HEX              (UNIQUE_MAJOR_VERSION << 16 | \
                                         UNIQUE_MINOR_VERSION << 8 | \
                                         UNIQUE_MICRO_VERSION)

/**
 * UNIQUE_API_VERSION:
 *
 * API version
 */
#define UNIQUE_API_VERSION              (1.0)

/**
 * UNIQUE_API_VERSION_S:
 *
 * API version as a string
 */
#define UNIQUE_API_VERSION_S            "1.0"

/**
 * UNIQUE_PROTOCOL_VERSION:
 *
 * Protocol version
 */
#define UNIQUE_PROTOCOL_VERSION         (1.0)

/**
 * UNIQUE_PROTOCOL_VERSION_S:
 *
 * Protocol version as a string
 */
#define UNIQUE_PROTOCOL_VERSION_S       "1.0"

/**
 * UNIQUE_DEFAULT_BACKEND_S:
 *
 * Default backend as a string
 */
#define UNIQUE_DEFAULT_BACKEND_S        "bacon"

/**
 * UNIQUE_CHECK_VERSION:
 * @major: major version, like 1
 * @minor: minor version, like 2
 * @micro: micro version, like 3
 *
 * Evaluates to %TRUE when the given version is higher than the version
 * of Unique.
 */
#define UNIQUE_CHECK_VERSION(major,minor,micro) \
        ((UNIQUE_MAJOR_VERSION > (major)) || \
         (UNIQUE_MAJOR_VERSION == (major) && UNIQUE_MINOR_VERSION > (minor)) || \
         (UNIQUE_MAJOR_VERSION == (major) && UNIQUE_MINOR_VERSION == (minor) && UNIQUE_MICRO_VERSION > (micro)))

#endif /* __UNIQUE_VERSION_H__ */
