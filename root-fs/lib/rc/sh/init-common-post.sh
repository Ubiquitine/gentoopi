# Copyright (c) 2007-2009 Roy Marples <roy@marples.name>
# Released under the 2-clause BSD license.

# mount $RC_SVCDIR as something we can write to if it's not rw
# On vservers, / is always rw at this point, so we need to clean out
# the old service state data
: ${RC_LIBEXECDIR:=/lib/rc}
: ${RC_SVCDIR:=/lib/rc/init.d}
case "$(rc --sys)" in
	OPENVZ|VSERVER)	rm -rf "$RC_SVCDIR"/*;;
	*)		if mountinfo --quiet "$RC_SVCDIR"; then
				rm -rf "$RC_SVCDIR"/*
			else
				mount_svcdir
			fi
			;;
esac
retval=$?

if [ -e "$RC_LIBEXECDIR"/cache/deptree ]; then
	cp -p "$RC_LIBEXECDIR"/cache/* "$RC_SVCDIR" 2>/dev/null
fi

echo sysinit >"$RC_SVCDIR"/softlevel
exit $retval
