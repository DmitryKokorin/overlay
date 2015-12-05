# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
inherit git-r3

EGIT_REPO_URI="https://github.com/zamaudio/${PN}.git"
if [[ ${PV} = 9999* ]]; then
	KEYWORDS=""
else
	EGIT_COMMIT=${PV}
	KEYWORDS="~amd64"
fi

DESCRIPTION="Collection of LV2/LADSPA/VST/JACK audio plugins for high quality processing"
HOMEPAGE=" http://www.zamaudio.com/?p=976"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="x11-libs/libX11
	virtual/opengl
	media-libs/liblo
	media-sound/jack-audio-connection-kit
	media-libs/ladspa-sdk"
DEPEND="${RDEPEND}
	virtual/pkgconfig"

src_install() {
	emake DESTDIR="${D}" PREFIX="${EPREFIX}/usr" LIBDIR=$(get_libdir) install
	dodoc README.md changelog
}
