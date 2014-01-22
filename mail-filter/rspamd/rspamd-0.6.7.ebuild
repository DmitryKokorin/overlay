# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit eutils cmake-utils

DESCRIPTION="Fast, free and open-source spam filtering system."
HOMEPAGE="https://rspamd.com/"
SRC_URI="http://rspamd.com/downloads/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-libs/libevent
		dev-libs/glib
		dev-libs/gmime
		dev-lang/lua"
RDEPEND="${DEPEND}"
