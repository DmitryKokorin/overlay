# $Header: $

EAPI=5

inherit git-2 toolchain-funcs

DESCRIPTION="Small command-line utilities"
HOMEPAGE="https://github.com/baskerville/sutils"
SRC_URI=""
EGIT_REPO_URI="git://github.com/baskerville/sutils.git"

LICENSE="public-domain"
SLOT="0"
KEYWORDS=""
IUSE=""

src_compile() {

    replace-flags -Os -O2
    export PREFIX=${EPREFIX}/usr
	emake
}
