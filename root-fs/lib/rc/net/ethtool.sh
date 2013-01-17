# Copyright (c) 2011 by Gentoo Foundation
# Released under the 2-clause BSD license.

ethtool_depend()
{
	program ethtool
	before interface
}

# This is just to trim whitespace, do not add any quoting!
_trim() {
	echo $*
}

ethtool_pre_start() {
	local order opt OFS="${OIFS}"
	eval order=\$ethtool_order_${IFVAR}
	[ -z "${order}" ] && eval order=\$ethtool_order
	[ -z "${order}" ] && order="flash change-eeprom change pause coalesce ring offload identify nfc rxfh-indir ntuple"
	# ethtool options not used: --driver, --register-dump, --eeprom-dump, --negotiate, --test, --statistics
	eindent
	for opt in ${order} ; do
		local args
		eval args=\$ethtool_$(echo $opt | tr - _)_${IFVAR}

		# Skip everything if no arguments
		[ -z "${args}" ] && continue

		# Split on \n
		OIFS="${IFS}"
		local IFS="$__IFS"

		for p in ${args} ; do
			IFS="${OIFS}"
			local args_pretty="$(_trim "${p}")"
			# Do nothing if empty
			[ -z "${args_pretty}" ] && continue
			[ "${opt}" = "ring" ] && opt="set-ring"
			args_pretty="--${opt} $IFACE ${args_pretty}"
			args="--${opt} $IFACE ${args}"
			ebegin "ethtool ${args_pretty}"
			ethtool ${args}
			rc=$?
			eend $rc "ethtool exit code $rc"
			# TODO: ethtool has MANY different exit codes, with no
			# documentation as to which ones are fatal or not. For now we
			# simply print the exit code and don't stop the start sequence.
		done
		IFS="${OIFS}"
	done
	eoutdent
}
