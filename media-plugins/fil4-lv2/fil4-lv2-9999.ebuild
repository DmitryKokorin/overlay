# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
inherit git-2 multilib

DESCRIPTION="4 Band Parametric EQ "
HOMEPAGE="http://github.com/x42/fil4.lv2"
SRC_URI=""
EGIT_REPO_URI="git://github.com/x42/fil4.lv2.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="media-libs/lv2
	virtual/opengl
	x11-libs/pango
	x11-libs/cairo
	virtual/glu
	sci-libs/fftw:3.0
	media-sound/jack-audio-connection-kit"
RDEPEND=""

DOCS=( AUTHORS README.md )

src_unpack() {
	git-2_src_unpack
	cd "${S}"
	make submodules
}

src_configure() {
	echo "Nothing to configure"
}

src_install() {
	emake DESTDIR="${D}" PREFIX="/usr" LIBDIR="$(get_libdir)" install
	base_src_install_docs
}
