#! /usr/bin/env sh
# This script is part of the eix project and distributed under the
# terms of the GNU General Public License v2.
#
# Author and Copyright (c):
#   Martin V\"ath <vaeth@mathematik.uni-wuerzburg.de>
#
# This file must be "source"d by POSIX scripts.
#
# It contains helper functions for eix-remote, eix-layman,
# and perhaps similar local scripts. (eix 0.25.5).

# This must happen in a function to enforce an empty argument list.
ReadFunctions() {
	ReadGettext
ReadFunctions() {
	:
}
}

: ${read_var_prg:=eix-update}
ReadVar() {
	eval "[ -n \"\${${2}++}\" ] && ${1}=\${${2}}" && return
	eixf_read=`PRINT_APPEND=X "${3:-${read_var_prg}}" --print "${2}"` || \
		return
	eval ${1}=\${eixf_read%X}
}

ReadBoolean() {
	case `PRINT_APPEND= "${2:-${read_var_prg}}" --print "${1}"` in
	[yYtTsSaA1:+-]*|[oO][nN])	return 0;;
	esac
	return 1
}

eixf_know_colors=false
SetColors() {
	${eixf_know_colors} && return
	eixf_know_colors=:
	ReadBoolean NOCOLORS && return
	! test -t 1 && ! ReadBoolean FORCE_USECOLORS && return
	eixf_good='\033[32;01m'
	eixf_warn='\033[33;01m'
	eixf_bad='\033[31;01m'
	eixf_normal='\033[0m'
}

StartInList() (
	ReadVar startlist ${2} || return
	for start in ${startlist}
	do	case ${1} in
		"${start}"*)	return 0;;
		esac
	done
	return 1
)

# Admissible statusline values are '' (check at first call), false or : (true)
statusline=
eixf_statusline=false
eixf_statusmode=EixfStatusmode
EixfStatusmode() {
	if [ -z "${statusline:++}" ]
	then	! ReadBoolean NOSTATUSLINE && {
			test -t 1 && ReadVar TERM TERM && \
				StartInList "${TERM}" TERM_STATUSLINE \
			|| ReadBoolean FORCE_STATUSLINE
		}
	else	${statusline}
	fi && eixf_statusline=: \
	&& if ReadVar TERM TERM && \
		StartInList "${TERM}" TERM_SOFTSTATUSLINE
	then	eixf_softstatus=:
	else	eixf_softstatus=false
	fi
	eixf_statusmode=${eixf_statusline}
	${eixf_statusmode}
}

StatuslinePlain() {
	${eixf_statusmode} || return 0
	! ${eixf_softstatus} || printf '\033k%s\033\\' "${*}"
	printf '\033]0;%s\007' "${*}"
}

Statusline() {
	StatuslinePlain "${0##*/}: ${*}"
}

verbose=:
StatusInfo() {
	Statusline "${*}"
	! ${verbose} || einfo "${*}"
}

Exit() {
	eixf_exit=${1:-${?}}
	${eixf_statusline} || exit ${eixf_exit}
	ReadVar EXIT_STATUSLINE EXIT_STATUSLINE
	if [ -n "${EXIT_STATUSLINE:++}" ]
	then	StatuslinePlain "${EXIT_STATUSLINE# }"
	elif [ ${eixf_exit} -eq 0 ]
	then	Statusline "`gettext 'Finished'`"
	else	Statusline "`gettext 'Failure'`"
	fi
	exit ${eixf_exit}
}

eerror() {
	eixf_eerror=${?}
	SetColors
	printf " ${eixf_bad}%s${eixf_normal} %s\n" '*' "${*}" >&2
	return ${eixf_eerror}
}

einfo() {
	SetColors
	printf " ${eixf_good}%s${eixf_normal} %s\n" '*' "${*}"
}

ewarn() {
	SetColors
	printf " ${eixf_warn}%s${eixf_normal} %s\n" '*' "${*}" >&2
}

ebegin() {
	SetColors
	printf " ${eixf_good}%s${eixf_normal} %s%s\n" '*' "${*}" '...'
}

eend() {
	[ ${1} -eq 0 ] && return
	eixf_eerror=${1}
	shift
	SetColors
	printf " ${eixf_bad}%s${eixf_normal} %s\n" '*' "${*}" >&2
	return ${eixf_eerror}
}

die() {
	[ ${#} -eq 0 ] || eerror "${*}"
	exitcode=2
	Exit ${exitcode}
}

PerLine() {
	while IFS='
' read eixf_line
	do	"${@}" "${eixf_line}"
	done
}

unset local_portdir
GetPortdir() {
	[ -n "${local_portdir++}" ] || ReadVar local_portdir PORTDIR
}

verbose=:
RunCommand() {
	Statusline "${1}"
	if ${verbose}
	then	einfo "${1}"
		shift
		"${@}"
		return ${?}
	fi
	ebegin "${1}"
	shift
	"${@}" >/dev/null
	eixf_ret=${?}
	eixf_cmd=${*}
	eend ${eixf_ret} "`eval_gettext 'Problems running ${eixf_cmd}'`"
	return ${eixf_ret}
}

if ( eval '[ "$(( 0 + 1 ))" = 1 ]' ) >/dev/null 2>&1
then	eval 'Expr() {
	printf "%s" "$(( ${1} ${2} ${3} ))"
}'
else	Expr() {
	expr "${@}"
}
fi

# Usage: Replace [-g] VAR Search Replace
# Option -g means: Replace all occurrences
# Exit status is 0 if at least one replacement took place, and
# $replace_count contains a string of length(number of replacements) x'en.
# $replace_tail is the string after the last replacement (or the whole string)
Replace() {
	eixf_repla=
	eixf_replc='break'
	case ${1} in
	-*)	eixf_replc=
		shift;;
	esac
	replace_count=
	eval replace_tail=\${${1}}
	while {
		eixf_replb=${replace_tail%%"${2}"*}
		[ "${eixf_replb}" != "${replace_tail}" ]
	}
	do	eixf_repla=${eixf_repla}${eixf_replb}${3}
		replace_tail=${replace_tail#*"${2}"}
		replace_count=${replace_count}x
		${eixf_replc}
	done
	eval ${1}=\${eixf_repla}\${replace_tail}
	[ -n "${replace_count:++}" ]
}

Push() {
# Rely on the existence of push.sh from http://github.com/vaeth/push/
	. push.sh
	Push "${@}"
}

# PushEscaped [-c] VAR Arg [name of IFS type variable]
# Similarly as Push, but splits Arg before at *unescaped* symbols of $IFS.
# The name IFS can be changed if a third (resp. fourth) argument is given.
PushEscaped() {
	case ${1} in
	-*)	shift
		eval ${1}=;;
	esac
	if [ ${#} -lt 3 ] || [ -z "${3:++}" ]
	then	eixf_pes='IFS'
	else	eixf_pes=${3}
	fi
	eixf_pea=${2}
	eixf_pew=
	while [ -n "${eixf_pea:++}" ]
	do	eval "eixf_pex=\${eixf_pea%%[\${${eixf_pes}}]*}"
		if [ "${eixf_pex}" != "${eixf_pea}" ]
		then	eixf_pec=${eixf_pea#"${eixf_pex}"}
			eixf_pea=${eixf_pec#?}
			eixf_pec=${eixf_pec%"${eixf_pea}"}
		else	eixf_pea=
			eixf_pec='\'
		fi
		Replace -g eixf_pex '\\' '\'
		[ -n "${replace_tail:++}" ] && case ${eixf_pex} in
		*\\)	eixf_pew=${eixf_pew}${eixf_pex%?}${eixf_pec}
			continue;;
		esac
		eixf_pew=${eixf_pew}${eixf_pex}
		[ -n "${eixf_pew:++}" ] && Push ${1} "${eixf_pew}"
		eixf_pew=
	done
	[ -n "${eixf_pew:++}" ] && Push ${1} "${eixf_pew}"
}

AddUpdateArgs() {
	Push update_args "${@}"
}

AddUpdateQuoting() {
	eixf_aq=${1}
	shift
	Replace -g eixf_aq '\' '\\'
	Replace -g eixf_aq '?' '\?'
	Replace -g eixf_aq '*' '\*'
	Replace -g eixf_aq '[' '\['
	AddUpdateArgs "${eixf_aq}" "${@}"
}

AddMethod() {
	AddUpdateArgs '-m'
	AddUpdateQuoting "${1}" "${2}"
}

AddRepoName() {
	AddUpdateArgs '-r' "${1}" "${2}"
}

AddOverlays() {
	for eixf_ao
	do	AddUpdateArgs '-a' "${eixf_ao}"
	done
}

AddExcludes() {
	for eixf_ax
	do	AddUpdateArgs '-x'
		AddUpdateQuoting "${eixf_ax}"
	done
}

ClearUpdateArgs() {
	update_args=
}

: ${die_on_update_failure=:}
CallUpdate() {
	case ${-} in
	*f*)
		eval "set -- ${update_args}";;
	*)
		set -f
		eval "set -- ${update_args}"
		set +f;;
	esac
	RunCommand "`gettext 'Calling eix-update'`" eix-update "${@}" && return
	${die_on_update_failure} && die "`gettext 'eix-update failed'`"
}

InitPortdirOverlay() {
	ReadVar PORTDIR_OVERLAY PORTDIR_OVERLAY
}

AddLocalMethods() {
	GetPortdir
	AddMethod "${local_portdir}" "eix"
	InitPortdirOverlay
	PushEscaped -c eixf_alm "${PORTDIR_OVERLAY}"
	ReadVar eixf_al ADD_OVERLAY
	PushEscaped eixf_alm "${eixf_al}"
	case ${-} in
	*f*)	eval "set -- ${eixf_alm}";;
	*)	set -f
		eval "set -- ${eixf_alm}"
		set +f;;
	esac
	for eixf_alm
	do	eixf_al=${eixf_alm}
		Replace -g eixf_al '\' '\\'
		Replace -g eixf_al ':' '\:'
		AddMethod "${eixf_alm}" "eix::${eixf_al}"
	done
}

# Remove optional trailing newline from all variables (arguments).
# This is necessary as some shells won't take ${Var%"[newline]"}
Chomp() {
	for eixf_chompa
	do	eval eixf_chompb=\${${eixf_chompa}}
		case ${eixf_chompb} in
		*'
')
			eixf_chompb=${eixf_chompb%?}
			eval ${eixf_chompa}=\${eixf_chompb};;
		esac
	done
}

# Consider variables (arguments) as commands and expand them to full path.
# Dies if a command cannot be found.

Pathify() {
	for eixf_pathc
	do	eval eixf_patha=\${${eixf_pathc}}
		eixf_pathb=`command -v "${eixf_patha}"; printf A` && \
			eixf_pathb=${eixf_pathb%A} && Chomp eixf_pathb && \
			[ -n "${eixf_pathb:++}" ] && test -x "${eixf_pathb}" \
			|| die "`eval_gettext \
				'${eixf_patha} cannot be found in PATH'`"
		eval ${eixf_pathc}=\${eixf_pathb}
	done
}

CheckReadlink() {
	[ -n "${readlink_stat:++}" ] && return ${readlink_stat}
	readlink -f / >/dev/null 2>&1
	readlink_stat=${?}
	return ${readlink_stat}
}

# Consider variables (arguments) as paths and normalize them.
# If normalize_resolve is : (default), use readlink/cd -P
# to resolve to "true" pathnames.
# Return with 1 if at least one variable is empty.
# Set relative to a list of all variables which are relative paths
# (the first token in relative will be a space if the list is not empty).

normalize_resolve=:
NormalizeNames() {
	eixf_normd=0
	relative=
	for eixf_normc
	do	eval eixf_norma=\${${eixf_normc}}
		if [ -z "${eixf_norma:++}" ]
		then	eixf_normd=1
			continue
		fi
		case ${eixf_norma} in
		/*)	:;;
		*)	relative="${relative} ${eixf_normc}";;
		esac
		${normalize_resolve} && if CheckReadlink
		then	# Append A to avoid loss of trailing space in `...`
			eixf_normb=`readlink -f -- "${eixf_norma}"; printf A` \
				&& eixf_normb=${eixf_normb%A} \
				&& Chomp eixf_normb
		elif test -d "${eixf_norma}"
		then	eixf_normb=`case ${eixf_norma} in
				/*)	cd -P "${eixf_norma}";;
				*)	cd -P "./${eixf_norma}";;
				esac >/dev/null 2>&1 \
				&& printf '%sA' "${PWD}"` \
				&& eixf_normb=${eixf_normb%A}
		else	false
		fi && [ -n "${eixf_normb:++}" ] && eixf_norma=${eixf_normb}
		eval ${eixf_normc}=\${eixf_norma}
		while Replace -g "${eixf_normc}" '//' '/'
		do	:
		done
		eval "[ \"\${${eixf_normc}}\" = '/' ] || \
			${eixf_normc}=\${${eixf_normc}%/}"
	done
	return ${eixf_normd}
}

ReadGettext() {
	case ${USE_NLS-yes} in
	''|[nNfF0]*)
		false;;
	esac && {
		. gettext.sh
		export TEXTDOMAIN='eix'
		export TEXTDOMAINDIR='/usr/share/locale'
ReadGettext() {
	:
}
		return 0
	}
gettext() {
	printf '%s' "${*}"
}
eixf_varopen='${'
eixf_varclose='}'
eval_gettext() {
	eixf_gettexta=${*}
	eixf_gettextb=
	while eixf_gettextc=${eixf_gettexta%%"${eixf_varopen}"*}
	do	eixf_gettextb=${eixf_gettextb}${eixf_gettextc}
		[ "${eixf_gettextc}" = "${eixf_gettexta}" ] && break
		eixf_gettexta=${eixf_gettexta#*"${eixf_varopen}"}
		eixf_gettextc=${eixf_gettexta%%"${eixf_varclose}"*}
		case ${eixf_gettextc} in
		"${eixf_gettexta}"|*[!a-zA-Z0-9_]*)
			eixf_gettextb=${eixf_gettextb}${eixf_varopen}
			continue;;
		esac
		eval eixf_gettextb=\${eixf_gettextb}\${${eixf_gettextc}}
		eixf_gettexta=${eixf_gettexta#*"${eixf_varclose}"}
	done
	printf '%s' "${eixf_gettextb}"
	unset eixf_gettexta eixf_gettextb eixf_gettextc
}
ngettext() {
	gettext "${1}"
}
eval_ngettext() {
	eval_gettext "${1}"
}
ReadGettext() {
	return 1
}
	return 1
}

unset have_random
AssignTempEmulate() {
	if [ -z "${have_random++}" ]
	then	eixf_assb=${RANDOM}
		if [ "${eixf_assb}" = "${RANDOM}" ] && \
			[ "${eixf_assb}" = "${RANDOM}" ]
		then	have_random=false
			eixf_assb=`od -d -N2 /dev/random 2>/dev/null` \
				|| eixf_assb=
			eixf_assb=`printf '%s' ${eixf_assb}`
			if [ -z "${eixf_assb:++}" ]
			then	eixf_assb=1
			else	eixf_assb=`Expr "${eixf_assb} % 32768"`
				[ "${eixf_assb}" -eq 0 ] && eixf_assb=1
			fi
		else	have_random=:
		fi
		eixf_assc=
	fi
	eixf_assa=0
	while [ ${eixf_assa} -le 9999 ]
	do	if [ -n "${eixf_assc:++}" ]
		then	if ${have_random}
			then	eixf_assb=${RANDOM}
			else	eixf_assb=`Expr "${eixf_assb}" '*' '13821'`
				eixf_assb=`Expr "${eixf_assb}" '%' '32768'`
			fi
		fi
		eixf_assc="/tmp/${0##*/}.${$}${eixf_assa}${eixf_assb}"
		if [ "${2}" = '-d' ]
		then	mkdir -m 700 -- "${eixf_assc}"
		else	(
			set -C
			: >"${eixf_assc}"
		)
		fi && eval ${1}=\${eixf_assc} && return
		eixf_assa=`Expr "${eixf_assa}" + 1`
	done
	die "`gettext 'found no free temporary name after 10000 attempts'`"
}

unset have_mktemp
AssignTemp() {
	eval ${1}=
	if [ -z "${have_mktemp++}" ]
	then	command -v mktemp >/dev/null 2>&1 \
			&& have_mktemp=: || have_mktemp=false
	fi
	if ${have_mktemp}
	then	eval ${1}'=`mktemp ${2} "/tmp/${0##*/}.XXXXXXXX"`'
	else	AssignTempEmulate "${@}"
	fi && return
	[ "${2}" = '-d' ] && \
		die "`gettext 'cannot create temporary directory'`"
	die "`gettext 'cannot create temporary file'`"
}
