# Copyright (c) 2007-2008 Roy Marples <roy@marples.name>
# Released under the 2-clause BSD license.

apipa_depend()
{
	program /sbin/arping
}

_random()
{
	local r=${RANDOM}
	if [ -n "${r}" ]; then
		echo "${r}"
	else
		uuidgen | sed -n -e 's/[^[:digit:]]//g' -e 's/\(^.\{1,7\}\).*/\1/p'
	fi
}

apipa_start()
{
	local iface="$1" i1= i2= addr= i=0

	_exists true || return 1

	einfo "Searching for free addresses in 169.254.0.0/16"
	eindent

	while [ ${i} -lt 64516 ]; do
		: $(( i1 = (_random % 255) + 1 ))
		: $(( i2 = (_random % 255) + 1 ))

		addr="169.254.${i1}.${i2}"
		vebegin "${addr}/16"
		if ! arping_address "${addr}"; then
			eval config_${config_index}="\"${addr}/16 broadcast 169.254.255.255\""
			: $(( config_index -= 1 ))
			veend 0
			eoutdent
			return 0
		fi

		: $(( i += 1 ))
	done

	eerror "No free address found!"
	eoutdent
	return 1
}
