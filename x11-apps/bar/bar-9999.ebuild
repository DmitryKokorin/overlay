# $Header: $

EAPI=5

inherit git-2 savedconfig

DESCRIPTION="A lightweight xcb based bar"
HOMEPAGE="https://github.com/LemonBoy/bar"
SRC_URI=""
EGIT_REPO_URI="git://github.com/LemonBoy/bar.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS=""
IUSE=""

src_prepare() {

    restore_config config.h
}

src_compile() {

    export PREFIX=${EPREFIX}/usr
	emake
}

src_install() {

    save_config config.h
    emake DESTDIR="${D}" install
}
