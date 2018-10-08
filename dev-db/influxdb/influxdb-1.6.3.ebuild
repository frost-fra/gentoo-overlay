## Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6
EGO_PN="github.com/influxdata/influxdb/..."

inherit user golang-build golang-vcs-snapshot

SRC_URI="https://${EGO_PN%/*}/archive/v${PV}.tar.gz -> ${P}.tar.gz
	https://github.com/collectd/go-collectd/archive/2ce144541b8903101fb8f1483cc0497a68798122.tar.gz -> collectd-go-collectd-2ce144541b8903101fb8f1483cc0497a68798122.tar.gz
	https://github.com/BurntSushi/toml/archive/a368813c5e648fee92e5f6c30e3944ff9d5e8895.tar.gz -> BurntSushi-toml-a368813c5e648fee92e5f6c30e3944ff9d5e8895.tar.gz
	https://github.com/RoaringBitmap/roaring/archive/d6540aab65a17321470b1661bfc52da1823871e9.tar.gz -> RoaringBitmap-roaring-d6540aab65a17321470b1661bfc52da1823871e9.tar.gz
	https://github.com/beorn7/perks/archive/4c0e84591b9aa9e6dcfdf3e020114cd81f89d5f9.tar.gz -> beorn7-perks-4c0e84591b9aa9e6dcfdf3e020114cd81f89d5f9.tar.gz
	https://github.com/bmizerany/pat/archive/6226ea591a40176dd3ff9cd8eff81ed6ca721a00.tar.gz -> bmizerany-pat-6226ea591a40176dd3ff9cd8eff81ed6ca721a00.tar.gz
	https://github.com/boltdb/bolt/archive/2f1ce7a837dcb8da3ec595b1dac9d0632f0f99e8.tar.gz -> boltdb-bolt-2f1ce7a837dcb8da3ec595b1dac9d0632f0f99e8.tar.gz
	https://github.com/cespare/xxhash/archive/5c37fe3735342a2e0d01c87a907579987c8936cc.tar.gz -> cespare-xxhash-5c37fe3735342a2e0d01c87a907579987c8936cc.tar.gz
	https://github.com/davecgh/go-spew/archive/346938d642f2ec3594ed81d874461961cd0faa76.tar.gz -> davecgh-go-spew-346938d642f2ec3594ed81d874461961cd0faa76.tar.gz
	https://github.com/dgrijalva/jwt-go/archive/06ea1031745cb8b3dab3f6a236daf2b0aa468b7e.tar.gz -> dgrijalva-jwt-go-06ea1031745cb8b3dab3f6a236daf2b0aa468b7e.tar.gz
	https://github.com/dgryski/go-bitstream/archive/9f22ccc24718d9643ac427c8c897ae1a01575783.tar.gz -> dgryski-go-bitstream-9f22ccc24718d9643ac427c8c897ae1a01575783.tar.gz
	https://github.com/glycerine/go-unsnap-stream/archive/62a9a9eb44fd8932157b1a8ace2149eff5971af6.tar.gz -> glycerine-go-unsnap-stream-62a9a9eb44fd8932157b1a8ace2149eff5971af6.tar.gz
	https://github.com/gogo/protobuf/archive/1adfc126b41513cc696b209667c8656ea7aac67c.tar.gz -> gogo-protobuf-1adfc126b41513cc696b209667c8656ea7aac67c.tar.gz
	https://github.com/golang/protobuf/archive/925541529c1fa6821df4e44ce2723319eb2be768.tar.gz -> golang-protobuf-925541529c1fa6821df4e44ce2723319eb2be768.tar.gz
	https://github.com/golang/snappy/archive/d9eb7a3d35ec988b8585d4a0068e462c27d28380.tar.gz -> golang-snappy-d9eb7a3d35ec988b8585d4a0068e462c27d28380.tar.gz
	https://github.com/google/go-cmp/archive/3af367b6b30c263d47e8895973edcca9a49cf029.tar.gz -> google-go-cmp-3af367b6b30c263d47e8895973edcca9a49cf029.tar.gz
	https://github.com/influxdata/influxql/archive/a7267bff5327e316e54c54342b0bc9598753e3d5.tar.gz -> influxdata-influxql-a7267bff5327e316e54c54342b0bc9598753e3d5.tar.gz
	https://github.com/influxdata/usage-client/archive/6d3895376368aa52a3a81d2a16e90f0f52371967.tar.gz -> influxdata-usage-client-6d3895376368aa52a3a81d2a16e90f0f52371967.tar.gz
	https://github.com/influxdata/yamux/archive/1f58ded512de5feabbe30b60c7d33a7a896c5f16.tar.gz -> influxdata-yamux-1f58ded512de5feabbe30b60c7d33a7a896c5f16.tar.gz
	https://github.com/influxdata/yarpc/archive/f0da2db138cad2fb425541938fc28dd5a5bc6918.tar.gz -> influxdata-yarpc-f0da2db138cad2fb425541938fc28dd5a5bc6918.tar.gz
	https://github.com/jsternberg/zap-logfmt/archive/ac4bd917e18a4548ce6e0e765b29a4e7f397b0b6.tar.gz -> jsternberg-zap-logfmt-ac4bd917e18a4548ce6e0e765b29a4e7f397b0b6.tar.gz
	https://github.com/jwilder/encoding/archive/b4e1701a28efcc637d9afcca7d38e495fe909a09.tar.gz -> jwilder-encoding-b4e1701a28efcc637d9afcca7d38e495fe909a09.tar.gz
	https://github.com/klauspost/compress/archive/6c8db69c4b49dd4df1fff66996cf556176d0b9bf.tar.gz -> klauspost-compress-6c8db69c4b49dd4df1fff66996cf556176d0b9bf.tar.gz
	https://github.com/klauspost/cpuid/archive/ae7887de9fa5d2db4eaa8174a7eff2c1ac00f2da.tar.gz -> klauspost-cpuid-ae7887de9fa5d2db4eaa8174a7eff2c1ac00f2da.tar.gz
	https://github.com/klauspost/crc32/archive/cb6bfca970f6908083f26f39a79009d608efd5cd.tar.gz -> klauspost-crc32-cb6bfca970f6908083f26f39a79009d608efd5cd.tar.gz
	https://github.com/klauspost/pgzip/archive/0bf5dcad4ada2814c3c00f996a982270bb81a506.tar.gz -> klauspost-pgzip-0bf5dcad4ada2814c3c00f996a982270bb81a506.tar.gz
	https://github.com/mattn/go-isatty/archive/6ca4dbf54d38eea1a992b3c722a76a5d1c4cb25c.tar.gz -> mattn-go-isatty-6ca4dbf54d38eea1a992b3c722a76a5d1c4cb25c.tar.gz
	https://github.com/matttproud/golang_protobuf_extensions/archive/3247c84500bff8d9fb6d579d800f20b3e091582c.tar.gz -> matttproud-golang_protobuf_extensions-3247c84500bff8d9fb6d579d800f20b3e091582c.tar.gz
	https://github.com/mschoch/smat/archive/90eadee771aeab36e8bf796039b8c261bebebe4f.tar.gz -> mschoch-smat-90eadee771aeab36e8bf796039b8c261bebebe4f.tar.gz
	https://github.com/opentracing/opentracing-go/archive/328fceb7548c744337cd010914152b74eaf4c4ab.tar.gz -> opentracing-opentracing-go-328fceb7548c744337cd010914152b74eaf4c4ab.tar.gz
	https://github.com/paulbellamy/ratecounter/archive/524851a93235ac051e3540563ed7909357fe24ab.tar.gz -> paulbellamy-ratecounter-524851a93235ac051e3540563ed7909357fe24ab.tar.gz
	https://github.com/peterh/liner/archive/6106ee4fe3e8435f18cd10e34557e5e50f0e792a.tar.gz -> peterh-liner-6106ee4fe3e8435f18cd10e34557e5e50f0e792a.tar.gz
	https://github.com/philhofer/fwd/archive/bb6d471dc95d4fe11e432687f8b70ff496cf3136.tar.gz -> philhofer-fwd-bb6d471dc95d4fe11e432687f8b70ff496cf3136.tar.gz
	https://github.com/prometheus/client_golang/archive/661e31bf844dfca9aeba15f27ea8aa0d485ad212.tar.gz -> prometheus-client_golang-661e31bf844dfca9aeba15f27ea8aa0d485ad212.tar.gz
	https://github.com/prometheus/client_model/archive/99fa1f4be8e564e8a6b613da7fa6f46c9edafc6c.tar.gz -> prometheus-client_model-99fa1f4be8e564e8a6b613da7fa6f46c9edafc6c.tar.gz
	https://github.com/prometheus/common/archive/e4aa40a9169a88835b849a6efb71e05dc04b88f0.tar.gz -> prometheus-common-e4aa40a9169a88835b849a6efb71e05dc04b88f0.tar.gz
	https://github.com/prometheus/procfs/archive/54d17b57dd7d4a3aa092476596b3f8a933bde349.tar.gz -> prometheus-procfs-54d17b57dd7d4a3aa092476596b3f8a933bde349.tar.gz
	https://github.com/retailnext/hllpp/archive/101a6d2f8b52abfc409ac188958e7e7be0116331.tar.gz -> retailnext-hllpp-101a6d2f8b52abfc409ac188958e7e7be0116331.tar.gz
	https://github.com/tinylib/msgp/archive/b2b6a672cf1e5b90748f79b8b81fc8c5cf0571a1.tar.gz -> tinylib-msgp-b2b6a672cf1e5b90748f79b8b81fc8c5cf0571a1.tar.gz
	https://github.com/willf/bitset/archive/d860f346b89450988a379d7d705e83c58d1ea227.tar.gz -> willf-bitset-d860f346b89450988a379d7d705e83c58d1ea227.tar.gz
	https://github.com/xlab/treeprint/archive/f3a15cfd24bf976c724324cb6846a8b54b88b639.tar.gz -> xlab-treeprint-f3a15cfd24bf976c724324cb6846a8b54b88b639.tar.gz
	https://github.com/uber-go/atomic/archive/8474b86a5a6f79c443ce4b2992817ff32cf208b8.tar.gz -> uber-go-atomic-8474b86a5a6f79c443ce4b2992817ff32cf208b8.tar.gz
	https://github.com/uber-go/multierr/archive/3c4937480c32f4c13a875a1829af76c98ca3d40a.tar.gz -> uber-go-multierr-3c4937480c32f4c13a875a1829af76c98ca3d40a.tar.gz
	https://github.com/uber-go/zap/archive/35aad584952c3e7020db7b839f6b102de6271f89.tar.gz -> uber-go-zap-35aad584952c3e7020db7b839f6b102de6271f89.tar.gz
	https://github.com/golang/crypto/archive/c3a3ad6d03f7a915c0f7e194b7152974bb73d287.tar.gz -> golang-crypto-c3a3ad6d03f7a915c0f7e194b7152974bb73d287.tar.gz
	https://github.com/golang/net/archive/92b859f39abd2d91a854c9f9c4621b2f5054a92d.tar.gz -> golang-net-92b859f39abd2d91a854c9f9c4621b2f5054a92d.tar.gz
	https://github.com/golang/sync/archive/1d60e4601c6fd243af51cc01ddf169918a5407ca.tar.gz -> golang-sync-1d60e4601c6fd243af51cc01ddf169918a5407ca.tar.gz
	https://github.com/golang/sys/archive/d8e400bc7db4870d786864138af681469693d18c.tar.gz -> golang-sys-d8e400bc7db4870d786864138af681469693d18c.tar.gz
	https://github.com/golang/text/archive/f21a4dfb5e38f5895301dc265a8def02365cc3d0.tar.gz -> golang-text-f21a4dfb5e38f5895301dc265a8def02365cc3d0.tar.gz
	https://github.com/golang/time/archive/26559e0f760e39c24d730d3224364aef164ee23f.tar.gz -> golang-time-26559e0f760e39c24d730d3224364aef164ee23f.tar.gz"


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
	_golang-include-src github.com/RoaringBitmap/roaring RoaringBitmap-roaring-*.tar.gz
	_golang-include-src github.com/beorn7/perks beorn7-perks-*.tar.gz
	_golang-include-src github.com/bmizerany/pat bmizerany-pat-*.tar.gz
	_golang-include-src github.com/boltdb/bolt boltdb-bolt-*.tar.gz
	_golang-include-src github.com/cespare/xxhash cespare-xxhash-*.tar.gz
	_golang-include-src github.com/davecgh/go-spew davecgh-go-spew-*.tar.gz
	_golang-include-src github.com/dgrijalva/jwt-go dgrijalva-jwt-go-*.tar.gz
	_golang-include-src github.com/dgryski/go-bitstream dgryski-go-bitstream-*.tar.gz
	_golang-include-src github.com/glycerine/go-unsnap-stream glycerine-go-unsnap-stream-*.tar.gz
	_golang-include-src github.com/gogo/protobuf gogo-protobuf-*.tar.gz
	_golang-include-src github.com/golang/protobuf golang-protobuf-*.tar.gz
	_golang-include-src github.com/golang/snappy golang-snappy-*.tar.gz
	_golang-include-src github.com/google/go-cmp google-go-cmp-*.tar.gz
	_golang-include-src github.com/influxdata/influxql influxdata-influxql-*.tar.gz
	_golang-include-src github.com/influxdata/usage-client influxdata-usage-client-*.tar.gz
	_golang-include-src github.com/influxdata/yamux influxdata-yamux-*.tar.gz
	_golang-include-src github.com/influxdata/yarpc influxdata-yarpc-*.tar.gz
	_golang-include-src github.com/jsternberg/zap-logfmt jsternberg-zap-logfmt-*.tar.gz
	_golang-include-src github.com/jwilder/encoding jwilder-encoding-*.tar.gz
	_golang-include-src github.com/klauspost/compress klauspost-compress-*.tar.gz
	_golang-include-src github.com/klauspost/cpuid klauspost-cpuid-*.tar.gz
	_golang-include-src github.com/klauspost/crc32 klauspost-crc32-*.tar.gz
	_golang-include-src github.com/klauspost/pgzip klauspost-pgzip-*.tar.gz
	_golang-include-src github.com/mattn/go-isatty mattn-go-isatty-*.tar.gz
	_golang-include-src github.com/matttproud/golang_protobuf_extensions matttproud-golang_protobuf_extensions-*.tar.gz
	_golang-include-src github.com/mschoch/smat mschoch-smat-*.tar.gz
	_golang-include-src github.com/opentracing/opentracing-go opentracing-opentracing-go-*.tar.gz
	_golang-include-src github.com/paulbellamy/ratecounter paulbellamy-ratecounter-*.tar.gz
	_golang-include-src github.com/peterh/liner peterh-liner-*.tar.gz
	_golang-include-src github.com/philhofer/fwd philhofer-fwd-*.tar.gz
	_golang-include-src github.com/prometheus/client_golang prometheus-client_golang-*.tar.gz
	_golang-include-src github.com/prometheus/client_model prometheus-client_model-*.tar.gz
	_golang-include-src github.com/prometheus/common prometheus-common-*.tar.gz
	_golang-include-src github.com/prometheus/procfs prometheus-procfs-*.tar.gz
	_golang-include-src github.com/retailnext/hllpp retailnext-hllpp-*.tar.gz
	_golang-include-src github.com/tinylib/msgp tinylib-msgp-*.tar.gz
	_golang-include-src github.com/willf/bitset willf-bitset-*.tar.gz
	_golang-include-src github.com/xlab/treeprint xlab-treeprint-*.tar.gz
	_golang-include-src go.uber.org/atomic uber-go-atomic-*.tar.gz
	_golang-include-src go.uber.org/multierr uber-go-multierr-*.tar.gz
	_golang-include-src go.uber.org/zap uber-go-zap-*.tar.gz
	_golang-include-src golang.org/x/crypto golang-crypto-*.tar.gz
	_golang-include-src golang.org/x/net golang-net-*.tar.gz
	_golang-include-src golang.org/x/sync golang-sync-*.tar.gz
	_golang-include-src golang.org/x/sys golang-sys-*.tar.gz
	_golang-include-src golang.org/x/text golang-text-*.tar.gz
	_golang-include-src golang.org/x/time golang-time-*.tar.gz
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
