# Copyright (c) 2007-2009 Roy Marples <roy@marples.name>
# Released under the 2-clause BSD license.

# Declare this here so that no formatting doesn't affect the embedded newline
__IFS="
"

# Handy function to handle all our unmounting needs
# mountinfo is a C program to actually find our mounts on our supported OS's
# We rely on fuser being present, so if it's not then don't unmount anything.
# This isn't a real issue for the BSD's, but it is for Linux.
do_unmount()
{
	local cmd="$1" retval=0 retry= pids=-
	local f_opts="-m -c" f_kill="-s " mnt=
	if [ "$RC_UNAME" = "Linux" ]; then
		f_opts="-m"
		f_kill="-"
	fi

	shift
	local IFS="$__IFS"
	set -- $(mountinfo "$@")
	unset IFS
	for mnt; do
		# Unmounting a shared mount can unmount other mounts, so
		# we need to check the mount is still valid
		mountinfo --quiet "$mnt" || continue
		# Ensure we interpret all characters properly.
		mnt=$(printf "$mnt")

		case "$cmd" in
			umount)
				ebegin "Unmounting $mnt"
				;;
			*)
				ebegin "Remounting $mnt read only"
				;;
		esac

		retry=4 # Effectively TERM, sleep 1, TERM, sleep 1, KILL, sleep 1
		while ! LC_ALL=C $cmd "$mnt" 2>/dev/null; do
			if type fuser >/dev/null 2>&1; then
				pids="$(fuser $f_opts "$mnt" 2>/dev/null)"
			fi
			case " $pids " in
				*" $$ "*)
					eend 1 "failed because we are using" \
					"$mnt"
					retry=0;;
				" - ")
					eend 1
					retry=0;;
				"  ")
					eend 1 "in use but fuser finds nothing"
					retry=0;;
				*)
					if [ $retry -le 0 ]; then
						eend 1
					else
						local sig="TERM"
						: $(( retry -= 1 ))
						[ $retry = 1 ] && sig="KILL"
						fuser $f_kill$sig -k $f_opts \
							"$mnt" >/dev/null 2>&1
						sleep 1
					fi
					;;
			esac
			[ $retry -le 0 ] && break
		done
		if [ $retry -le 0 ]; then
			retval=1
		else
			eend 0
		fi
	done
	return $retval
}
