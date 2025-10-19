# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Simple Gentoo system update script"
HOMEPAGE="https://github.com/skevas/gentoo-update"

if [[ ${PV} == 9999 ]]; then
    inherit git-r3
    EGIT_REPO_URI="https://github.com/skevas/gentoo-update.git"
else
    SRC_URI="https://github.com/skevas/gentoo-update/archive/v${PV}.tar.gz -> ${P}.tar.gz"
    KEYWORDS="amd64"
fi

LICENSE="MIT"
SLOT="0"

RDEPEND="
    sys-apps/portage
    app-portage/eix
    app-portage/gentoolkit
"

src_install() {
    # Hauptskript installieren
    dobin gentoo_update.sh
    newbin gentoo_update.sh gentoo-update
}

