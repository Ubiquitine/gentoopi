# Copyright (c) 2007-2008 Roy Marples <roy@marples.name>
# Released under the 2-clause BSD license.

macchanger_depend()
{
	before macnet
	# no program 'macchanger', as we have partial functionality without it
}

_config_vars="$_config_vars mac"

macchanger_pre_start()
{
	# We don't change MAC addresses from background
	yesno ${IN_BACKGROUND} && return 0

	local mac= opts=

	eval mac=\$mac_${IFVAR}
	[ -z "${mac}" ] && return 0

	_exists true || return 1

	ebegin "Changing MAC address of ${IFACE}"

	# The interface needs to be up for macchanger to work most of the time
	_down

	mac=$(echo "${mac}" | tr '[:upper:]' '[:lower:]')
	local hex="[0-9a-f][0-9a-f]"
	case "${mac}" in
		# specific mac-addr
		${hex}:${hex}:${hex}:${hex}:${hex}:${hex})
			# We don't need macchanger to change to a specific
			# mac address
			_set_mac_address "${mac}"
			if eend "$?"; then
				mac=$(_get_mac_address)
				eindent
				einfo "changed to ${mac}"
				eoutdent
				_up
				return 0
			fi
			;;

		# increment MAC address, default macchanger behavior
		increment) opts="${opts}";;

		# randomize just the ending bytes
		random-ending) opts="${opts} -e";;

		# keep the same kind of physical layer (eg fibre, copper)
		random-samekind) opts="${opts} -a";;

		# randomize to any known vendor of any physical layer type
		random-anykind) opts="${opts} -A";;

		# fully random bytes
		random-full|random) opts="${opts} -r";;

		# default case is just to pass on all the options
		*) opts="${opts} ${mac}";;
	esac

	if [ ! -x /sbin/macchanger ]; then
		eerror "For changing MAC addresses, emerge net-analyzer/macchanger"
		return 1
	fi

	mac=$(/sbin/macchanger ${opts} "${IFACE}" \
		| sed -n -e 's/^Faked MAC:.*\<\(..:..:..:..:..:..\)\>.*/\U\1/p' )
	_up

	# Sometimes the interface needs to be up ....
	if [ -z "${mac}" ]; then
		mac=$(/sbin/macchanger ${opts} "${IFACE}" \
		| sed -n -e 's/^Faked MAC:.*\<\(..:..:..:..:..:..\)\>.*/\U\1/p' )
	fi

	if [ -z "${mac}" ]; then
		eend 1 "Failed to set MAC address"
		return 1
	fi

	eend 0
	eindent
	einfo "changed to" "${mac}"
	eoutdent

	return 0
}
