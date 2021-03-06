# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

inherit eutils

MY_P="sp-auth"

DESCRIPTION="SopCast free P2P Internet TV binary"
LICENSE="SopCast-EULA"
HOMEPAGE="http://www.sopcast.com/"
SRC_URI="http://sopcast-player.googlecode.com/files/${MY_P}-${PV}.tar.gz"

SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

QA_PRESTRIPPED="opt/${PN}/${PN}"

# All dependencies might not be listed, since the binary blob's homepage only lists libstdc++
RDEPEND=">=virtual/libstdc++-3.3"

DEPEND="${RDEPEND}"

S=${WORKDIR}/${MY_P}

src_install() {
	exeinto /opt/${PN}
	newexe sp-sc-auth ${PN} || die "newexe failed"
	dosym /opt/${PN}/${PN} /usr/bin/${PN}
	dodoc Readme || die "dodoc failed"
}
