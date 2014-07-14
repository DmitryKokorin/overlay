# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-misc/youtube-dl/youtube-dl-2013.11.07.ebuild,v 1.1 2013/11/07 16:18:23 jer Exp $

EAPI=5

PYTHON_COMPAT=(python{2_7,3_2,3_3,3_4})
DISTUTILS_SINGLE_IMPL=true
inherit python-single-r1 eutils git-2

DESCRIPTION="Script for downloading Coursera.org videos and naming them."
HOMEPAGE="http://github.com/coursera-dl/coursera"
SRC_URI=""
EGIT_REPO_URI="git://github.com/coursera-dl/coursera.git"

LICENSE="LGPL-3+"
SLOT="0"
KEYWORDS="~amd64"
IUSE="test"

RDEPEND="
    dev-python/beautifulsoup:4
    dev-python/html5lib
    test? ( dev-python/nose[${PYTHON_USEDEP}] )
    dev-python/requests
    dev-python/six
"

DEPEND="
    ${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]
"

RESTRICT="test"

S="${WORKDIR}/${PN}"


src_install() {
	python_domodule coursera
	dobin ${PN}
	python_fix_shebang "${ED}"
}

python_test() {
        nosetests || die "Tests fail with ${EPYTHON}"
}

