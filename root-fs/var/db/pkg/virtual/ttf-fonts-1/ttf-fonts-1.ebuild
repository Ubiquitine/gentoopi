# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/virtual/ttf-fonts/ttf-fonts-1.ebuild,v 1.9 2012/07/27 12:39:34 grobian Exp $

DESCRIPTION="Virtual for Serif/Sans/Monospace font packages"
HOMEPAGE=""
SRC_URI=""

LICENSE=""
SLOT="0"
KEYWORDS="alpha amd64 arm hppa ia64 ~mips ppc ppc64 s390 sh sparc x86 ~amd64-fbsd ~x86-fbsd ~x86-freebsd ~x86-interix ~amd64-linux ~x86-linux ~ppc-macos ~x64-macos ~x86-macos ~m68k-mint ~sparc-solaris ~sparc64-solaris ~x64-solaris ~x86-solaris"
IUSE=""

DEPEND=""
RDEPEND="|| (
		media-fonts/dejavu
		media-fonts/ttf-bitstream-vera
		media-fonts/liberation-fonts
		media-fonts/droid
		media-fonts/freefont-ttf
		media-fonts/corefonts
	)"
