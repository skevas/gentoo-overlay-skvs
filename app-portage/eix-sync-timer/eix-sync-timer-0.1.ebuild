EAPI=8

inherit systemd

DESCRIPTION="Systemd timer for daily eix-sync updates"
HOMEPAGE="https://github.com/skevas/eix-sync-timer"
SRC_URI="https://github.com/skevas/eix-sync-timer/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
    app-portage/eix
    sys-apps/systemd
"

S="${WORKDIR}/${P}"

src_install() {
    # Unit-Dateien aus dem Repository installieren
    systemd_dounit eix-sync.service
    systemd_dounit eix-sync.timer
    
    # Timer aktivieren (Symlink erstellen)
    systemd_enable_service timers.target eix-sync.timer
    
    # Optional: README oder Dokumentation installieren
    if [[ -f README.md ]]; then
        dodoc README.md
    fi
}

pkg_postinst() {
    elog "Der eix-sync Timer wurde installiert und aktiviert."
    elog ""
    elog "Starten Sie den Timer mit:"
    elog "  systemctl daemon-reload"
    elog "  systemctl start eix-sync.timer"
    elog ""
    elog "Status prüfen mit:"
    elog "  systemctl status eix-sync.timer"
    elog "  systemctl list-timers eix-sync.timer"
}

