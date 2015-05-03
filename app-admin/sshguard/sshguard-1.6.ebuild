# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
inherit eutils flag-o-matic

if [[ ${PV} = 9999* ]]; then
	LIVE="true"
fi

#if LIVE
EGIT_REPO_URI="http://bitbucket.org/${PN}/${PN}.git"
inherit git-r3
#endif

DESCRIPTION="protects hosts from brute force attacks against ssh"
HOMEPAGE="http://sshguard.sourceforge.net/ https://bitbucket.org/sshguard/sshguard"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="ipfilter kernel_FreeBSD kernel_linux"

#if LIVE
KEYWORDS=
SRC_URI=
#endif

CDEPEND="kernel_linux? ( net-firewall/iptables )
	kernel_FreeBSD? ( !ipfilter? ( sys-freebsd/freebsd-pf ) )"
DEPEND="${CDEPEND}
	sys-devel/flex"
RDEPEND="${CDEPEND}
	sys-apps/openrc
	virtual/logger"

DOCS=( README.rst ChangLog scripts/sshguard_backendgen.sh )

src_configure() {
	# Needed for usleep(3), see "nasty" in src/sshguard_logsuck.c
	append-cppflags -D_BSD_SOURCE

	local myconf
	if use kernel_linux; then
		einfo "Selected firewall backend: iptables"
		myconf="--with-firewall=iptables"
	elif use kernel_FreeBSD; then
		if use ipfilter; then
			einfo "Selected firewall backend: ipfw"
			myconf="--with-firewall=ipfw"
		else
			einfo "Selected firewall backend: pf"
			myconf="--with-firewall=pf"
		fi
	fi

	econf ${myconf}
}

src_install() {
	default
	dodoc examples/*
	newinitd "${FILESDIR}"/${PN}.initd ${PN}
	newconfd "${FILESDIR}"/${PN}.confd ${PN}
}
