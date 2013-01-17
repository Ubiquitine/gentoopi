#!/bin/sh
# Copyright (c) 2007-2009 Roy Marples <roy@marples.name>
# Released under the 2-clause BSD license.

: ${CONSOLE:=/dev/console}
: ${RC_LIBEXECDIR:=/lib/rc}

service_present()
{
	local p="/etc/runlevels/$1/$2"
	# fail if the file doesn't exist
	[ ! -e "$p" ] && return 1
	# succeed if $RC_SYS empty, can't check further, assume script will run
	[ -z "$RC_SYS" ] && return 0
	# fail if file contains "-$RC_SYS", because then it won't run
	egrep -qi "^[[:space:]]*keyword[[:space:]].*-$RC_SYS\>" "$p" && return 1
	# succeed otherwise
	return 0
}

if [ -e "$RC_LIBEXECDIR"/console/unicode ]; then
	termencoding="%G"
	kmode="-u"
else
	termencoding="(K"
	kmode="-a"
fi

# Try and set a font and as early as we can
if service_present "$RC_DEFAULTLEVEL" consolefont ||
   service_present "$RC_BOOTLEVEL" consolefont; then
	printf "\033%s" "$termencoding" >"$CONSOLE" 2>/dev/null
	if [ -r "$RC_LIBEXECDIR"/console/font -a -x /usr/bin/setfont ]; then
		font="$(cat "$RC_LIBEXECDIR"/console/font)"
		[ -c "$CONSOLE" ] && cons="-C $CONSOLE"
		setfont $cons "$RC_LIBEXECDIR"/console/"$font" 2>/dev/null
	fi
fi

# Try and set a keyboard map as early as possible
if service_present "$RC_DEFAULTLEVEL" keymaps ||
   service_present "$RC_BOOTLEVEL" keymaps; then
	kbd_mode $kmode -C "$CONSOLE" 2>/dev/null
	if [ -r "$RC_LIBEXECDIR"/console/keymap ]; then
		loadkeys -q "$RC_LIBEXECDIR"/console/keymap 2>/dev/null
	fi
fi

# Ensure we exit 0 so the boot continues
exit 0
