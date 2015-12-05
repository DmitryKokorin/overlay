# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
inherit cmake-utils flag-o-matic

DESCRIPTION="An LV2 audio plugin implementing a powerful and flexible parametric equalizer"
HOMEPAGE="http://eq10q.sourceforge.net/"
MY_PV=${PV/_beta/-beta}
MY_PV=${MY_PV/_p/.}
MY_P=${PN}-${MY_PV}
SRC_URI="mirror://sourceforge/${PN}/${MY_P}.tar.gz"
S=${WORKDIR}/${MY_P}

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="dev-cpp/gtkmm:2.4
	media-libs/lv2
	sci-libs/fftw:3.0"
DEPEND="${RDEPEND}
	virtual/pkgconfig"

pkg_setup() {
	if has_version \>=dev-libs/libsigc++-2.6 ; then
		append-cppflags -std=c++11
	fi
}

src_configure() {
	local mycmakeargs=(
		-DCMAKE_INSTALL_PREFIX="${EPREFIX}/usr/$(get_libdir)/lv2"
	)
	cmake-utils_src_configure
}
