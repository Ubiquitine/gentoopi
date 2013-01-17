# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/www-client/midori/midori-0.4.7.ebuild,v 1.2 2012/10/21 12:00:16 ssuominen Exp $

EAPI=4

unset _live_inherits

if [[ ${PV} == *9999* ]]; then
	EGIT_REPO_URI="git://git.xfce.org/apps/${PN}"
	_live_inherits=git-2
else
	KEYWORDS="~amd64 ~arm ~ppc ~x86 ~x86-fbsd"
	SRC_URI="mirror://xfce/src/apps/${PN}/${PV%.*}/${P}.tar.bz2"
fi

inherit eutils fdo-mime gnome2-utils python waf-utils ${_live_inherits}

VALA_VERSION=0.18

DESCRIPTION="A lightweight web browser based on WebKitGTK+"
HOMEPAGE="http://twotoasts.de/index.php/midori/"

LICENSE="LGPL-2.1 MIT"
SLOT="0"
IUSE="+deprecated doc gnome libnotify nls +unique zeitgeist"

RDEPEND=">=dev-db/sqlite-3.6.19:3
	>=dev-libs/glib-2.22
	dev-libs/libxml2
	>=net-libs/libsoup-2.34:2.4
	x11-libs/libXScrnSaver
	deprecated? (
		net-libs/webkit-gtk:2
		x11-libs/gtk+:2
		unique? ( dev-libs/libunique:1 )
		)
	!deprecated? (
		>=app-crypt/gcr-3
		net-libs/webkit-gtk:3
		x11-libs/gtk+:3
		unique? ( dev-libs/libunique:3 )
		)
	gnome? ( >=net-libs/libsoup-gnome-2.34:2.4 )
	libnotify? ( >=x11-libs/libnotify-0.7 )
	zeitgeist? ( >=dev-libs/libzeitgeist-0.3.14 )"
DEPEND="${RDEPEND}
	|| ( dev-lang/python:2.7 dev-lang/python:2.6 )
	dev-lang/vala:${VALA_VERSION}
	dev-util/intltool
	gnome-base/librsvg
	doc? ( dev-util/gtk-doc )
	nls? ( sys-devel/gettext )"

pkg_setup() {
	python_set_active_version 2
	python_pkg_setup

	DOCS=( AUTHORS ChangeLog HACKING INSTALL TODO TRANSLATE )
	HTML_DOCS=( data/faq.html data/faq.css )
}

src_unpack() {
	if [[ ${PV} == *9999* ]]; then
		git-2_src_unpack
	else
		default
	fi
}

src_prepare() {
	# TODO: Both zeitgeist and gcr should have ./configure switch!
	use zeitgeist || { sed -i -e 's:zeitgeist:&dIsAbLe:' wscript || die; }

	# Force disabled because we don't have this custom renamed in Portage
	sed -i -e 's:gcr-3-gtk2:&dIsAbLe:' wscript || die
}

src_configure() {
	strip-linguas -i po

	VALAC="$(type -P valac-${VALA_VERSION})" \
	waf-utils_src_configure \
		--disable-docs \
		 $(use_enable doc apidocs) \
		 $(use_enable unique) \
		 $(use_enable libnotify) \
		--enable-addons \
		$(use_enable nls) \
		$(use_enable !deprecated gtk3) \
		--disable-granite
}

pkg_preinst() {
	gnome2_icon_savelist
}

pkg_postinst() {
	fdo-mime_desktop_database_update
	fdo-mime_mime_database_update
	gnome2_icon_cache_update
}

pkg_postrm() {
	fdo-mime_desktop_database_update
	fdo-mime_mime_database_update
	gnome2_icon_cache_update
}
