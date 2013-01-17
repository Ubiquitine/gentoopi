# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/x11-drivers/xf86-input-mouse/xf86-input-mouse-1.8.1.ebuild,v 1.7 2012/12/17 20:12:10 maekke Exp $

EAPI=4
inherit xorg-2

DESCRIPTION="X.Org driver for mouse input devices"

KEYWORDS="~alpha amd64 arm ~hppa ~ia64 ~mips ppc ppc64 ~sh ~sparc x86 ~amd64-fbsd ~x86-fbsd"
IUSE=""

RDEPEND=">=x11-base/xorg-server-1.7"
DEPEND="${RDEPEND}"

# To workaround gcc-4.6 bug 435640
PATCHES=(
	"${FILESDIR}"/${P}-gcc46-workaround.patch
)
