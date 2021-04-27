# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python{2_7,3_8} )

inherit git-r3 python-r1

DESCRIPTION="A tiny script to issue and renew TLS certs from Let's Encrypt"
HOMEPAGE="https://github.com/diafygi/acme-tiny"
KEYWORDS=""
EGIT_REPO_URI="https://github.com/diafygi/${PN}.git"

LICENSE="MIT"
SLOT="0"
IUSE=""

DOCS=( README.md )

src_install() {
	default
	dobin acme_tiny.py
}
