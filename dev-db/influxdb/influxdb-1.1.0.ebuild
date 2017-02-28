## Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6
EGO_PN="github.com/influxdata/influxdb/..."

inherit user golang-build golang-vcs-snapshot

SRC_URI="https://${EGO_PN%/*}/archive/v${PV}.tar.gz -> ${P}.tar.gz
	 https://github.com/collectd/go-collectd/archive/9fc824c70f713ea0f058a07b49a4c563ef2a3b98.tar.gz -> collectd-go-collectd-9fc824c70f713ea0f058a07b49a4c563ef2a3b98.tar.gz
	 https://github.com/BurntSushi/toml/archive/99064174e013895bbd9b025c31100bd1d9b590ca.tar.gz -> BurntSushi-toml-99064174e013895bbd9b025c31100bd1d9b590ca.tar.gz
	 https://github.com/bmizerany/pat/archive/c068ca2f0aacee5ac3681d68e4d0a003b7d1fd2c.tar.gz -> bmizerany-pat-c068ca2f0aacee5ac3681d68e4d0a003b7d1fd2c.tar.gz
	 https://github.com/boltdb/bolt/archive/5cc10bbbc5c141029940133bb33c9e969512a698.tar.gz -> boltdb-bolt-5cc10bbbc5c141029940133bb33c9e969512a698.tar.gz
	 https://github.com/davecgh/go-spew/archive/5215b55f46b2b919f50a1df0eaa5886afe4e3b3d.tar.gz -> davecgh-go-spew-5215b55f46b2b919f50a1df0eaa5886afe4e3b3d.tar.gz
	 https://github.com/dgrijalva/jwt-go/archive/63734eae1ef55eaac06fdc0f312615f2e321e273.tar.gz -> dgrijalva-jwt-go-63734eae1ef55eaac06fdc0f312615f2e321e273.tar.gz
	 https://github.com/dgryski/go-bits/archive/2ad8d707cc05b1815ce6ff2543bb5e8d8f9298ef.tar.gz -> dgryski-go-bits-2ad8d707cc05b1815ce6ff2543bb5e8d8f9298ef.tar.gz
	 https://github.com/dgryski/go-bitstream/archive/7d46cd22db7004f0cceb6f7975824b560cf0e486.tar.gz -> dgryski-go-bitstream-7d46cd22db7004f0cceb6f7975824b560cf0e486.tar.gz
	 https://github.com/gogo/protobuf/archive/0394392b81058a7f972029451f06e528bb18ba50.tar.gz -> gogo-protobuf-0394392b81058a7f972029451f06e528bb18ba50.tar.gz
	 https://github.com/golang/snappy/archive/d9eb7a3d35ec988b8585d4a0068e462c27d28380.tar.gz -> golang-snappy-d9eb7a3d35ec988b8585d4a0068e462c27d28380.tar.gz
	 https://github.com/influxdata/usage-client/archive/6d3895376368aa52a3a81d2a16e90f0f52371967.tar.gz -> influxdata-usage-client-6d3895376368aa52a3a81d2a16e90f0f52371967.tar.gz
	 https://github.com/jwilder/encoding/archive/4dada27c33277820fe35c7ee71ed34fbc9477d00.tar.gz -> jwilder-encoding-4dada27c33277820fe35c7ee71ed34fbc9477d00.tar.gz
	 https://github.com/kimor79/gollectd/archive/61d0deeb4ffcc167b2a1baa8efd72365692811bc.tar.gz -> kimor79-gollectd-61d0deeb4ffcc167b2a1baa8efd72365692811bc.tar.gz
	 https://github.com/paulbellamy/ratecounter/archive/5a11f585a31379765c190c033b6ad39956584447.tar.gz -> paulbellamy-ratecounter-5a11f585a31379765c190c033b6ad39956584447.tar.gz
	 https://github.com/peterh/liner/archive/8975875355a81d612fafb9f5a6037bdcc2d9b073.tar.gz -> peterh-liner-8975875355a81d612fafb9f5a6037bdcc2d9b073.tar.gz
	 https://github.com/rakyll/statik/archive/274df120e9065bdd08eb1120e0375e3dc1ae8465.tar.gz -> rakyll-statik-274df120e9065bdd08eb1120e0375e3dc1ae8465.tar.gz
	 https://github.com/retailnext/hllpp/archive/38a7bb71b483e855d35010808143beaf05b67f9d.tar.gz -> retailnext-hllpp-38a7bb71b483e855d35010808143beaf05b67f9d.tar.gz
         https://github.com/golang/crypto/archive/c197bcf24cde29d3f73c7b4ac6fd41f4384e8af6.tar.gz -> golang-crypto-c197bcf24cde29d3f73c7b4ac6fd41f4384e8af6.tar.gz"


KEYWORDS="~amd64 ~arm"

DESCRIPTION="The InfluxDB time series database"
HOMEPAGE="https://github.com/influxdata/influxdb"

LICENSE="MIT"
SLOT="0"
IUSE=""

_golang-include-src() {
        local VENDORPN=$1 TARBALL=$2
        mkdir -p "${WORKDIR}/${P}/src/${VENDORPN}" || die
        tar -C "${WORKDIR}/${P}/src/${VENDORPN}" -x --strip-components 1\
                -f "${DISTDIR}"/${TARBALL} || die
}

pkg_setup() {
	elog "Create User and Group"
        enewgroup ${PN}
        enewuser ${PN} -1 -1 "/var/lib/${PN}" ${PN}
}

src_unpack() {
        golang-vcs-snapshot_src_unpack
	_golang-include-src collectd.org collectd-go-collectd-*.tar.gz
	_golang-include-src github.com/BurntSushi/toml BurntSushi-toml-*.tar.gz
	_golang-include-src github.com/bmizerany/pat bmizerany-pat-*.tar.gz
        _golang-include-src github.com/boltdb/bolt boltdb-bolt-*.tar.gz
        _golang-include-src github.com/davecgh/go-spew davecgh-go-spew-*.tar.gz
        _golang-include-src github.com/dgrijalva/jwt-go dgrijalva-jwt-go-*.tar.gz
        _golang-include-src github.com/dgryski/go-bits dgryski-go-bits-*.tar.gz
        _golang-include-src github.com/dgryski/go-bitstream dgryski-go-bitstream-*.tar.gz
        _golang-include-src github.com/gogo/protobuf gogo-protobuf-*.tar.gz
        _golang-include-src github.com/golang/snappy golang-snappy-*.tar.gz
        _golang-include-src github.com/influxdata/usage-client influxdata-usage-client-*.tar.gz
        _golang-include-src github.com/jwilder/encoding jwilder-encoding-*.tar.gz
        _golang-include-src github.com/kimor79/gollectd kimor79-gollectd-*.tar.gz
        _golang-include-src github.com/paulbellamy/ratecounter paulbellamy-ratecounter-*.tar.gz
        _golang-include-src github.com/peterh/liner peterh-liner-*.tar.gz
        _golang-include-src github.com/rakyll/statik rakyll-statik-*.tar.gz
        _golang-include-src github.com/retailnext/hllpp retailnext-hllpp-*.tar.gz
        _golang-include-src golang.org/x/crypto golang-crypto-*.tar.gz
}

src_compile() {
	elog "Gehe in Verzeichnis: src/${EGO_PN%/*}"
	pushd src/${EGO_PN%/*} || die
        elog "Die Variable WORKDIR: ${WORKDIR}"
	elog "Die Variable P: ${P}"
        elog "Die Variable D: ${D}"
        elog "Die Variable S: ${S}"
	elog "Die Variable EGO_PN: ${EGO_PN}"
	elog "Die Variable EGO_PN%/*: ${EGO_PN%/*}"
	elog "Start compiling..."
        GOPATH="${WORKDIR}/${P}" go install ./... || die
	elog "Build the manpages"
	make -C man/ clean install DESTDIR="${S}/man"
        popd || die
}

src_install() {
	pushd ${S}/bin || die
	dobin *
	popd || die
	pushd src/${EGO_PN%/*} || die
	insinto /etc/influxdb
	newins etc/config.sample.toml influxdb.conf.example
	insinto /etc/logrotate.d
	newins scripts/logrotate influxdb
	popd || die
	newconfd "${FILESDIR}/${PN}.confd" "${PN}"
	newinitd "${FILESDIR}/${PN}.initd" "${PN}"
	pushd ${S}/man/share/man/man1 || die
	doman *.1
	popd || die
}
