# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

DESCRIPTION="A Painting software for linux"
HOMEPAGE="http://sourceforge.jp/projects/azpainter/"
SRC_URI="http://iij.dl.sourceforge.jp/azpainter/60112/${P}-src.tar.bz2"

LICENSE="GPL-3 LGPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="sys-libs/glibc
	sys-devel/gcc
	x11-libs/libX11
	x11-libs/libXext
	x11-libs/libXft
	x11-libs/libXi
	x11-libs/libXrender
	x11-libs/libXau
	x11-libs/libXdmcp
	x11-libs/libxcb
	dev-libs/expat
	media-libs/libjpeg-turbo
	app-arch/bzip2
	media-libs/fontconfig
	media-libs/freetype
	sys-libs/zlib"
DEPEND="${RDEPEND}"

src_unpack() {
	unpack ${A}
}

src_prepare() {
	sed -i 's/\/usr\/local/\/usr/' Makefile || die "sed failed"
}

src_install() {
    emake DESTDIR="${D}" install
}
