## Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6
EGO_PN="github.com/influxdata/influxdb/..."

inherit user golang-build golang-vcs-snapshot

SRC_URI="https://${EGO_PN%/*}/archive/v${PV}.tar.gz -> ${P}.tar.gz
	https://github.com/collectd/go-collectd/archive/e84e8af5356e7f47485bbc95c96da6dd7984a67e.tar.gz -> collectd-go-collectd-e84e8af5356e7f47485bbc95c96da6dd7984a67e.tar.gz
	https://github.com/BurntSushi/toml/archive/a368813c5e648fee92e5f6c30e3944ff9d5e8895.tar.gz -> BurntSushi-toml-a368813c5e648fee92e5f6c30e3944ff9d5e8895.tar.gz
	https://github.com/bmizerany/pat/archive/c068ca2f0aacee5ac3681d68e4d0a003b7d1fd2c.tar.gz -> bmizerany-pat-c068ca2f0aacee5ac3681d68e4d0a003b7d1fd2c.tar.gz
	https://github.com/boltdb/bolt/archive/4b1ebc1869ad66568b313d0dc410e2be72670dda.tar.gz -> boltdb-bolt-4b1ebc1869ad66568b313d0dc410e2be72670dda.tar.gz
	https://github.com/cespare/xxhash/archive/1b6d2e40c16ba0dfce5c8eac2480ad6e7394819b.tar.gz -> cespare-xxhash-1b6d2e40c16ba0dfce5c8eac2480ad6e7394819b.tar.gz
	https://github.com/davecgh/go-spew/archive/346938d642f2ec3594ed81d874461961cd0faa76.tar.gz -> davecgh-go-spew-346938d642f2ec3594ed81d874461961cd0faa76.tar.gz
	https://github.com/dgrijalva/jwt-go/archive/24c63f56522a87ec5339cc3567883f1039378fdb.tar.gz -> dgrijalva-jwt-go-24c63f56522a87ec5339cc3567883f1039378fdb.tar.gz
	https://github.com/dgryski/go-bits/archive/2ad8d707cc05b1815ce6ff2543bb5e8d8f9298ef.tar.gz -> dgryski-go-bits-2ad8d707cc05b1815ce6ff2543bb5e8d8f9298ef.tar.gz
	https://github.com/dgryski/go-bitstream/archive/7d46cd22db7004f0cceb6f7975824b560cf0e486.tar.gz -> dgryski-go-bitstream-7d46cd22db7004f0cceb6f7975824b560cf0e486.tar.gz
	https://github.com/gogo/protobuf/archive/1c2b16bc280d6635de6c52fc1471ab962dc36ec9.tar.gz -> gogo-protobuf-1c2b16bc280d6635de6c52fc1471ab962dc36ec9.tar.gz
	https://github.com/golang/snappy/archive/d9eb7a3d35ec988b8585d4a0068e462c27d28380.tar.gz -> golang-snappy-d9eb7a3d35ec988b8585d4a0068e462c27d28380.tar.gz
	https://github.com/google/go-cmp/archive/18107e6c56edb2d51f965f7d68e59404f0daee54.tar.gz -> google-go-cmp-18107e6c56edb2d51f965f7d68e59404f0daee54.tar.gz
	https://github.com/influxdata/influxql/archive/3921ab7858b6af8443fe0bef06b52608be72852c.tar.gz -> influxdata-influxql-3921ab7858b6af8443fe0bef06b52608be72852c.tar.gz
	https://github.com/influxdata/usage-client/archive/6d3895376368aa52a3a81d2a16e90f0f52371967.tar.gz -> influxdata-usage-client-6d3895376368aa52a3a81d2a16e90f0f52371967.tar.gz
	https://github.com/influxdata/yamux/archive/1f58ded512de5feabbe30b60c7d33a7a896c5f16.tar.gz -> influxdata-yamux-1f58ded512de5feabbe30b60c7d33a7a896c5f16.tar.gz
	https://github.com/influxdata/yarpc/archive/036268cdec22b7074cd6d50cc6d7315c667063c7.tar.gz -> influxdata-yarpc-036268cdec22b7074cd6d50cc6d7315c667063c7.tar.gz
	https://github.com/jwilder/encoding/archive/27894731927e49b0a9023f00312be26733744815.tar.gz -> jwilder-encoding-27894731927e49b0a9023f00312be26733744815.tar.gz
	https://github.com/paulbellamy/ratecounter/archive/5a11f585a31379765c190c033b6ad39956584447.tar.gz -> paulbellamy-ratecounter-5a11f585a31379765c190c033b6ad39956584447.tar.gz
	https://github.com/peterh/liner/archive/88609521dc4b6c858fd4c98b628147da928ce4ac.tar.gz -> peterh-liner-88609521dc4b6c858fd4c98b628147da928ce4ac.tar.gz
	https://github.com/philhofer/fwd/archive/1612a298117663d7bc9a760ae20d383413859798.tar.gz -> philhofer-fwd-1612a298117663d7bc9a760ae20d383413859798.tar.gz
	https://github.com/retailnext/hllpp/archive/38a7bb71b483e855d35010808143beaf05b67f9d.tar.gz -> retailnext-hllpp-38a7bb71b483e855d35010808143beaf05b67f9d.tar.gz
	https://github.com/spaolacci/murmur3/archive/0d12bf811670bf6a1a63828dfbd003eded177fce.tar.gz -> spaolacci-murmur3-0d12bf811670bf6a1a63828dfbd003eded177fce.tar.gz
	https://github.com/tinylib/msgp/archive/ad0ff2e232ad2e37faf67087fb24bf8d04a8ce20.tar.gz -> tinylib-msgp-ad0ff2e232ad2e37faf67087fb24bf8d04a8ce20.tar.gz
	https://github.com/uber-go/atomic/archive/74ca5ec650841aee9f289dce76e928313a37cbc6.tar.gz -> uber-go-atomic-74ca5ec650841aee9f289dce76e928313a37cbc6.tar.gz
	https://github.com/uber-go/zap/archive/fbae0281ffd546fa6d1959fec6075ac5da7fb577.tar.gz -> uber-go-zap-fbae0281ffd546fa6d1959fec6075ac5da7fb577.tar.gz
	https://github.com/xlab/treeprint/archive/06dfc6fa17cdde904617990a0c2d89e3e332dbb3.tar.gz -> xlab-treeprint-06dfc6fa17cdde904617990a0c2d89e3e332dbb3.tar.gz
	https://github.com/golang/crypto/archive/9477e0b78b9ac3d0b03822fd95422e2fe07627cd.tar.gz -> golang-crypto-9477e0b78b9ac3d0b03822fd95422e2fe07627cd.tar.gz
	https://github.com/golang/sys/archive/062cd7e4e68206d8bab9b18396626e855c992658.tar.gz -> golang-sys-062cd7e4e68206d8bab9b18396626e855c992658.tar.gz
	https://github.com/golang/text/archive/a71fd10341b064c10f4a81ceac72bcf70f26ea34.tar.gz -> golang-text-a71fd10341b064c10f4a81ceac72bcf70f26ea34.tar.gz"


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
	_golang-include-src github.com/cespare/xxhash cespare-xxhash-*.tar.gz
	_golang-include-src github.com/davecgh/go-spew davecgh-go-spew-*.tar.gz
	_golang-include-src github.com/dgrijalva/jwt-go dgrijalva-jwt-go-*.tar.gz
	_golang-include-src github.com/dgryski/go-bits dgryski-go-bits-*.tar.gz
	_golang-include-src github.com/dgryski/go-bitstream dgryski-go-bitstream-*.tar.gz
	_golang-include-src github.com/gogo/protobuf gogo-protobuf-*.tar.gz
	_golang-include-src github.com/golang/snappy golang-snappy-*.tar.gz
	_golang-include-src github.com/google/go-cmp google-go-cmp-*.tar.gz
	_golang-include-src github.com/influxdata/influxql influxdata-influxql-*.tar.gz
	_golang-include-src github.com/influxdata/usage-client influxdata-usage-client-*.tar.gz
	_golang-include-src github.com/influxdata/yamux influxdata-yamux-*.tar.gz
	_golang-include-src github.com/influxdata/yarpc influxdata-yarpc-*.tar.gz
	_golang-include-src github.com/jwilder/encoding jwilder-encoding-*.tar.gz
	_golang-include-src github.com/paulbellamy/ratecounter paulbellamy-ratecounter-*.tar.gz
	_golang-include-src github.com/peterh/liner peterh-liner-*.tar.gz
	_golang-include-src github.com/philhofer/fwd philhofer-fwd-*.tar.gz
	_golang-include-src github.com/retailnext/hllpp retailnext-hllpp-*.tar.gz
	_golang-include-src github.com/spaolacci/murmur3 spaolacci-murmur3-*.tar.gz
	_golang-include-src github.com/tinylib/msgp tinylib-msgp-*.tar.gz
	_golang-include-src github.com/uber-go/atomic uber-go-atomic-*.tar.gz
	_golang-include-src github.com/uber-go/zap uber-go-zap-*.tar.gz
	_golang-include-src github.com/xlab/treeprint xlab-treeprint-*.tar.gz
	_golang-include-src golang.org/x/crypto golang-crypto-*.tar.gz
	_golang-include-src golang.org/x/sys golang-sys-*.tar.gz
	_golang-include-src golang.org/x/text golang-text-*.tar.gz
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
        GOPATH="${WORKDIR}/${P}" go install -ldflags="-X main.version=${PV}" ./... || die
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
	newins "${FILESDIR}/${PN}.conf" "${PN}.conf"
	insinto /etc/logrotate.d
	newins scripts/logrotate influxdb
	popd || die
	newconfd "${FILESDIR}/${PN}.confd" "${PN}"
	newinitd "${FILESDIR}/${PN}.initd" "${PN}"
	pushd ${S}/man/share/man/man1 || die
	doman *.1
	popd || die
}
