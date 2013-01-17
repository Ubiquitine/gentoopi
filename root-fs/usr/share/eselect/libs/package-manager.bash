# -*-eselect-*-  vim: ft=eselect
# Copyright (c) 2005-2012 Gentoo Foundation
# $Id: package-manager.bash.in 859 2012-01-21 11:04:25Z ulm $
# This file is part of the 'eselect' tools framework.
#
# eselect is free software: you can redistribute it and/or modify it under the
# terms of the GNU General Public License as published by the Free Software
# Foundation, either version 2 of the License, or (at your option) any later
# version.
#
# eselect is distributed in the hope that it will be useful, but WITHOUT ANY
# WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR
# A PARTICULAR PURPOSE.  See the GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License along with
# eselect.  If not, see <http://www.gnu.org/licenses/>.

# package_manager PRIVATE
# Return the package manager we're going to use.
package_manager() {
	local pm
	case ${PACKAGE_MANAGER} in
		portage) pm=portage ;;
		pkgcore) pm=pkgcore ;;
		paludis) pm=paludis ;;
	esac
	echo "${pm:-portage}"
}

# portageq
# Run portageq with safe filename as set by configure. Redirect stderr
portageq() {
	/usr/bin/portageq "$@" 2>/dev/null
}

# run_paludis PRIVATE
# Run CAVE (defaults to "cave"). Redirect stderr
run_paludis() {
	${CAVE:-cave} "$@" 2>/dev/null
}

# arch
# Return the architecture we're running on...
arch() {
	local ret=$(envvar sys-devel/gcc ARCH) suffix

	# $arch will be null if there's no current make.profile symlink
	# we cannot get a list of valid profiles without it.
	if [[ -z ${ret} ]] ; then

		if [[ -n ${ROOT} && ${ROOT} != "/" ]] ; then
			write_warning_msg "Failed to determine \${ARCH}. Is your make.profile symlink valid?"
			return 1
		fi

		ret=$(uname -m)
		case ${ret} in
			alpha|ia64|m68k|ppc|ppc64) ;;
			arm*) ret=arm ;;
			i?86) ret=x86 ;;
			mips*) ret=mips ;;
			parisc*) ret=hppa ;;
			"Power Macintosh") ret=ppc ;;
			s390*) ret=s390 ;;
			sh*) ret=sh ;;
			sparc*) ret=sparc ;;
			x86_64) ret=amd64 ;;
			*) write_warning_msg \
				"Unknown architecture. Please submit a bug including the output of 'uname -m'"
				return 1
				;;
		esac

		case $(uname -s) in
			Linux) ;;
			FreeBSD) suffix="-fbsd" ;;
			NetBSD) suffix="-nbsd" ;;
			OpenBSD) suffix="-obsd" ;;
			DragonFly) suffix="-dfly" ;;
			Darwin) suffix="-macos" ;;
			*) write_warning_msg \
				"Unknown OS. Please submit a bug including the output of 'uname -s'"
				return 1
				;;
		esac
	fi

	echo ${ret}${suffix}
}

# envvar
# Return the contents of environment variable $2 as seen by package manager
# for package $1.
envvar() {
	[[ $# -eq 2 ]] || die "envvar expects exactly 2 arguments"
	case $(package_manager) in
		# portage does not support per-package envvar lookup
		portage) portageq envvar "$2" ;;
		pkgcore) pinspect portageq envvar "$2" ;;
		paludis) run_paludis print-id-environment-variable --best \
			--variable-name "$2" --format '%v\n' "$1" ;;
	esac
}

# best_version
# Return true if package $1 is available in ${ROOT}
best_version() {
	[[ $# -eq 1 ]] || die "best_version expects exactly one argument"
	case $(package_manager) in
		portage) portageq best_version "${EROOT:-/}" "$1" ;;
		pkgcore) pinspect portageq best_version "${ROOT:-/}" "$1" ;;
		paludis) run_paludis print-best-version --format name-version "$1" ;;
	esac
}

# has_version
# Return true if package $1 is available in ${ROOT}
has_version() {
	[[ $# -eq 1 ]] || die "has_version expects exactly one argument"
	case $(package_manager) in
		portage) portageq has_version "${EROOT:-/}" "$1" ;;
		pkgcore) pinspect portageq has_version "${ROOT:-/}" "$1" ;;
		paludis) run_paludis has-version "$1" ;;
	esac
}

# get_repositories
# return list of repositories known to the package manager
get_repositories() {
	case $(package_manager) in
		portage) portageq get_repos "${EROOT:-/}" ;;
		pkgcore) pinspect portageq get_repositories ;;
		paludis) run_paludis print-repositories ;;
	esac
}

# get_repo_news_dir
# return the directory where to find GLEP 42 news items for repository $1
get_repo_news_dir() {
	[[ $# -eq 1 ]] || die "get_repo_news_dir expects exactly one argument"
	local repo=$1
	case $(package_manager) in
		portage) echo "$(portageq get_repo_path \
			"${EROOT:-/}" "${repo}")/metadata/news" ;;
		pkgcore) pinspect portageq get_repo_news_path "${repo}" ;;
		paludis) run_paludis print-repository-metadata ${repo} \
			--raw-name newsdir --format '%v\n' ;;
	esac
}

# env_update
# Run env-update command, if available with the package manager
# If $1 is non-zero: also run ldconfig to update /etc/ld.so.cache
env_update() {
	local noldconfig
	[[ $1 -ne 0 ]] || noldconfig=y
	case $(package_manager) in
		portage) "/usr/sbin/env-update" ${noldconfig:+--no-ldconfig} ;;
		pkgcore) pmaint env-update ${noldconfig:+--skip-ldconfig} ;;
		paludis) return 127 ;;
	esac
}