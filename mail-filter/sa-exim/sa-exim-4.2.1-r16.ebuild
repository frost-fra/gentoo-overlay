# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $
EAPI=6

inherit eutils

IUSE=""

DESCRIPTION="Exim SpamAssassin at SMTP time"
HOMEPAGE="http://marc.merlins.org/linux/exim/sa.html"
SRC_URI="http://http.debian.net/debian/pool/main/s/sa-exim/${PN}_${PV}.orig.tar.gz
http://http.debian.net/debian/pool/main/s/sa-exim/${PN}_${PVR/r/}.debian.tar.xz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="x86 amd64"

DEPEND="www-client/links"
RDEPEND=">=mail-mta/exim-4.20
	>=mail-filter/spamassassin-2.53"


src_unpack() {
    unpack ${A}
    cd "${S}"
    EPATCH_SOURCE="${WORKDIR}/debian/patches" EPATCH_SUFFIX="patch" \
        EPATCH_FORCE="yes" epatch
    cp ${FILESDIR}/eximinc/${PF}/* ${WORKDIR}/${P}/eximinc/
}


src_compile () 
{
	emake SACONF=/etc/exim/sa-exim.conf || die
}

src_install () 
{
        insinto /usr/lib/exim/local_scan
	doins accept.so ${P}.so
	dosym /usr/lib/exim/local_scan/${P}.so /usr/lib/exim/local_scan/sa-exim.so
	
	insinto /etc/exim
	newins ${S}/sa-exim.conf sa-exim.conf.dist
	newins ${S}/sa-exim_short.conf sa-exim_short.conf.dist
	sed -i -e "s:/var/spool/exim/SA:/var/spool/sa-exim/:g" ${D}/etc/exim/sa-exim.conf.dist
	sed -i -e "s:/var/spool/exim/SA:/var/spool/sa-exim/:g" ${D}/etc/exim/sa-exim_short.conf.dist

	keepdir /var/spool/sa-exim/tuplets
	
	insinto /etc/exim/include
	doins ${FILESDIR}/sa-exim_localscan.conf
	
	dodoc LICENSE README README.greylisting TODO CHANGELOG ACKNOWLEDGEMENTS
	dohtml *.html
	
        eval `perl '-V:installvendorlib'`
        dodir ${installvendorlib}/Mail/SpamAssassin/Plugin
	insinto ${installvendorlib}/Mail/SpamAssassin/Plugin
	doins ${S}/Greylisting.pm
	
	dodir /etc/mail/spamassassin
	insinto /etc/mail/spamassassin
	doins ${FILESDIR}/sa-exim.cf
	sed -i -e "s:@Greylisting@:${installvendorlib}/Mail/SpamAssassin/Plugin/Greylisting.pm:g" ${D}/etc/mail/spamassassin/sa-exim.cf
	
	exeinto /etc/cron.hourly
	newexe ${FILESDIR}/sa-exim_greylistclean.cron sa-exim_greylistclean

	exeinto /etc/cron.daily
	newexe ${FILESDIR}/sa-learn.cron sa-learn	

}

pkg_postinst () 
{
	einfo ""
	einfo "Documentation is in /usr/share/doc/${P}"
	einfo "Check README.gentoo.gz there for some basic gentoo installation instructions"
	einfo ""
}
