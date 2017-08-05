# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5
inherit versionator

BDATE="03_03_2017"
BUILD="build_352"
MY_PV="$(delete_all_version_separators)_${BDATE}_${BUILD}"

DESCRIPTION="Steinberg Virtual Studio Technology software development kit"
HOMEPAGE="http://www.steinberg.net/en/company/developers.html"
SRC_URI="http://www.steinberg.net/sdk_downloads/vstsdk${MY_PV}.zip"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="app-arch/unzip"
RDEPEND=""

RESTRICT="mirror"
S=${WORKDIR}

src_compile() { :; }

src_install() {
	insinto /usr/share
	doins -r VST_SDK
}

pkg_postinst() {
	einfo "Please make sure to review the license agreement, which can be found at:"
	einfo "${ROOT}usr/share/VST_SDK/VST3_SDK/doc/VST3_License_Agreement.html"
}
