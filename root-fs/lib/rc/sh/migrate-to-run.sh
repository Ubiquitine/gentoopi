#!/bin/sh
# Copyright (c) 2012 William Hubbs <w.d.hubbs@gmail.com>
# Released under the 2-clause BSD license.

. "/lib/rc/sh/functions.sh"

if ! mountinfo -q -f tmpfs "/lib/rc/init.d"; then
	einfo "The OpenRC dependency data has already been migrated."
	exit 0
fi

if [ ! -d /run ]; then
	eerror "/run is not a directory."
	eerror "moving /run to /run.pre-openrc"
	mv /run /run.pre-openrc
	mkdir /run
fi

rm -rf /run/openrc

if ! mountinfo -q -f tmpfs /run; then
	ln -s "/lib/rc"/init.d /run/openrc
else
	cp -a "/lib/rc/init.d" /run/openrc
	rc-update -u
fi

einfo "The OpenRC dependency data was migrated successfully."
exit 0
