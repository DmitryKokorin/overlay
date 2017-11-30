# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

PYTHON_COMPAT=(python{2_7,3_2,3_3,3_4,3_5})
DISTUTILS_SINGLE_IMPL=true
inherit python-single-r1 eutils git-r3

DESCRIPTION="Script for downloading Coursera.org videos and naming them."
HOMEPAGE="https://github.com/coursera-dl/coursera"
SRC_URI=""
EGIT_REPO_URI="https://github.com/coursera-dl/coursera-dl.git"

LICENSE="LGPL-3+"
SLOT="0"
KEYWORDS="~amd64"
IUSE="test"

RDEPEND="
	dev-python/beautifulsoup:4
	dev-python/html5lib
	dev-python/requests
	dev-python/six
"

DEPEND="
	${RDEPEND}
	test? ( dev-python/nose[${PYTHON_USEDEP}] )
	dev-python/setuptools[${PYTHON_USEDEP}]
"

RESTRICT="test"

src_install() {
	python_domodule coursera-dl
	dobin ${PN}
	python_fix_shebang "${ED}"
}

python_test() {
	nosetests || die "Tests fail with ${EPYTHON}"
}
