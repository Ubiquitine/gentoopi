# 2011-09-22	Stef Simoens <stef@bgs.org>
#		based on vlan.sh & tuntap.sh
# Copyright (c) 2007-2008 Roy Marples <roy@marples.name>
# All rights reserved. Released under the 2-clause BSD license.

macvlan_depend()
{
	program ip
	after interface
	before dhcp macchanger
}

_is_macvlan()
{
	[ -n "$(export RC_SVCNAME="net.${IFACE}"; service_get_value macvlan)" ]
}

macvlan_pre_start()
{
	# MAC-VLAN needs an existing interface to link to
	local macvlan=
	eval macvlan=\$macvlan_${IFVAR}
	[ -z "${macvlan}" ] && return 0

	case " ${MODULES} " in
		*" ifconfig "*)
				eerror "sys-apps/iproute2 is required to configure MACVLANs"
				return 1 ;;
	esac

	# optional mode, default to "private"
	local mode=
	eval mode=\$mode_${IFVAR}
	[ -z "${mode}" ] && mode="private"

	ebegin "Creating MAC-VLAN ${IFACE} to ${macvlan}"
	e="$(ip link add link "${macvlan}" name "${IFACE}" type macvlan mode "${mode}" 2>&1 1>/dev/null)"
	if [ -n "${e}" ]; then
		eend 1 "${e}"
	else
		eend 0 && _up && service_set_value macvlan "${macvlan}"
	fi
}


macvlan_post_stop()
{
	_is_macvlan || return 0

	ebegin "Removing MAC-VLAN ${IFACE}"
	ip link delete "${IFACE}" type macvlan >/dev/null
	eend $?
}
