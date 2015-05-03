# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit eutils

DESCRIPTION="An open source cross-platform drum plugin and stand-alone application"
HOMEPAGE="http://www.drumgizmo.org"
SRC_URI="http://www.drumgizmo.org/releases/${P}/${P}.tar.gz"

LICENSE="GPL-3"
SLOT=0
KEYWORDS="~amd64"
IUSE="cli editor +lv2"

RDEPEND="lv2? ( media-libs/lv2 )
        x11-libs/libX11
        >=media-libs/libsndfile-1.0.21
        >=media-libs/libpng-1.2
        dev-libs/expat"
DEPEND="${RDEPEND}"

src_configure() {

    econf $(use_enable lv2) \
          $(use_enable cli) \
          $(use_enable editor)
}
