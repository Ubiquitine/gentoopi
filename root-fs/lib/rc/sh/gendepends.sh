#!/bin/sh
# Shell wrapper to list our dependencies

# Copyright (c) 2007-2009 Roy Marples <roy@marples.name>
# Released under the 2-clause BSD license.

. /lib/rc/sh/functions.sh
. /lib/rc/sh/rc-functions.sh

config() {
	[ -n "$*" ] && echo "$RC_SVCNAME config $*" >&3
}
need() {
	[ -n "$*" ] && echo "$RC_SVCNAME ineed $*" >&3
}
use() {
	[ -n "$*" ] && echo "$RC_SVCNAME iuse $*" >&3
}
before() {
	[ -n "$*" ] && echo "$RC_SVCNAME ibefore $*" >&3
}
after() {
	[ -n "$*" ] && echo "$RC_SVCNAME iafter $*" >&3
}
provide() {
	[ -n "$*" ] && echo "$RC_SVCNAME iprovide $*" >&3
}
keyword() {
	[ -n "$*" ] && echo "$RC_SVCNAME keyword $*" >&3
}
depend() {
	:
}

_done_dirs=
for _dir in \
/etc/init.d \
/usr/etc/init.d \
/usr/local/etc/init.d
do
	[ -d "$_dir" ] || continue

	# Don't do the same dir twice
	for _d in $_done_dirs; do
		[ "$_d" = "$_dir" ] && continue 2
	done
	unset _d
	_done_dirs="$_done_dirs $_dir"

	cd "$_dir"
	for RC_SERVICE in *; do
		[ -x "$RC_SERVICE" -a -f "$RC_SERVICE" ] || continue

		# Only generate dependencies for runscripts
		read one two three <"$RC_SERVICE"
		[ "$one" = "#!/sbin/runscript" ] || \
		[ "$one" = "#!" -a "$two" = "/sbin/runscript" ] || \
			continue
		unset one two three

		export RC_SVCNAME=${RC_SERVICE##*/}

		# Compat
		export SVCNAME=$RC_SVCNAME

		(
		# Save stdout in fd3, then remap it to stderr
		exec 3>&1 1>&2

		_rc_c=${RC_SVCNAME%%.*}
		if [ -n "$_rc_c" -a "$_rc_c" != "$RC_SVCNAME" ]; then
			if [ -e "$_dir/../conf.d/$_rc_c" ]; then
				. "$_dir/../conf.d/$_rc_c"
			fi
		fi
		unset _rc_c

		if [ -e "$_dir/../conf.d/$RC_SVCNAME" ]; then
			. "$_dir/../conf.d/$RC_SVCNAME"
		fi

		[ -e /etc/rc.conf ] && . /etc/rc.conf

		if . "$_dir/$RC_SVCNAME"; then
			echo "$RC_SVCNAME" >&3
			_depend
		fi
		)
	done
done
