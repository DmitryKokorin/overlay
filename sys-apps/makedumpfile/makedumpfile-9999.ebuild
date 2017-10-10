# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit eutils
if [ ${PV} = 9999 ]; then
	inherit git-r3
	EGIT_REPO_URI="git://git.code.sf.net/p/${PN}/code"
	KEYWORDS=""
else
	SRC_URI="mirrot://sourceforge/${PN}/${P}.tar.gz"
	KEYWORDS="~x86"
fi

DESCRIPTION="makedumpfile command shortens kernel dump files"
HOMEPAGE="https://sourceforge.net/projects/makedumpfile/"

LICENSE="GPL-2+"
SLOT="0"
IUSE="lzo
	snappy
	static"

RDEPEND="dev-libs/elfutils
	lzo? ( dev-libs/lzo )
	snappy? ( app-arch/snappy )"
DEPEND="${RDEPEND}"

src_compile () {
	emake LINKTYPE=dynamic
}
