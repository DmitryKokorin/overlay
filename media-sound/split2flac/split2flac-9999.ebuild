# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/media-sound/split2flac/split2flac-9999.ebuild,v 1.4 2012/05/19 09:11:44 ssuominen Exp $

EAPI="4"

inherit git-2

DESCRIPTION="sh script to split one big APE/FLAC/WV/WAV audio image with CUE sheet into tracks"
HOMEPAGE="https://github.com/ftrvxmtrx/split2flac"
EGIT_REPO_URI="git://github.com/ftrvxmtrx/split2flac.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS=""
IUSE="enca flake imagemagick mac mp3 mp4 ogg replaygain wavpack"

RDEPEND="
	app-cdr/cuetools
	media-sound/shntool[mac?]
	virtual/libiconv
	media-libs/flac
	enca? ( app-i18n/enca )
	flake? ( media-sound/flake )
	mp3? ( media-sound/lame || ( media-libs/mutagen media-libs/id3lib ) )
	mp4? ( media-libs/faac media-libs/libmp4v2:0[utils] )
	ogg? ( media-sound/vorbis-tools )
	wavpack? ( media-sound/wavpack )
	replaygain? (
		mp3? ( media-sound/mp3gain )
		mp4? ( media-sound/aacgain )
		ogg? ( media-sound/vorbisgain )
	)
	imagemagick? ( media-gfx/imagemagick )
"

src_install() {
	dobin "${PN}"
	dosym "${PN}" /usr/bin/split2wav
	for i in mp3 mp4 ogg
	do
		use $i && dosym "${PN}" /usr/bin/split2${i/mp4/m4a}
	done
}
