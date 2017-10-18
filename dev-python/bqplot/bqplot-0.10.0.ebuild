# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
PYTHON_COMPAT=( python{2_7,3_3,3_4,3_5} )

inherit distutils-r1

DESCRIPTION="Interactive plotting for the Jupyter notebook, using d3.js and ipywidgets."
HOMEPAGE="https://github.com/bloomberg/bqplot"
SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

RDEPEND="~dev-python/ipywidgets-7.0.0
	>=dev-python/traitlets-4.3.0
	>=dev-python/traittypes-0.0.6
	>=dev-python/numpy-1.10.4
	dev-python/pandas"
DEPEND="${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]
	net-libs/nodejs[npm]"

RESTRICT="test"
