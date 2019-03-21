## Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6
EGO_PN="github.com/influxdata/influxdb/..."

inherit user golang-build golang-vcs-snapshot

SRC_URI="https://${EGO_PN%/*}/archive/v${PV}.tar.gz -> ${P}.tar.gz
	https://github.com/collectd/go-collectd/archive/2ce144541b8903101fb8f1483cc0497a68798122.tar.gz -> collectd-go-collectd-2ce144541b8903101fb8f1483cc0497a68798122.tar.gz
	https://github.com/BurntSushi/toml/archive/a368813c5e648fee92e5f6c30e3944ff9d5e8895.tar.gz -> BurntSushi-toml-a368813c5e648fee92e5f6c30e3944ff9d5e8895.tar.gz
	https://github.com/beorn7/perks/archive/3a771d992973f24aa725d07868b467d1ddfceafb.tar.gz -> beorn7-perks-3a771d992973f24aa725d07868b467d1ddfceafb.tar.gz
	https://github.com/bmizerany/pat/archive/6226ea591a40176dd3ff9cd8eff81ed6ca721a00.tar.gz -> bmizerany-pat-6226ea591a40176dd3ff9cd8eff81ed6ca721a00.tar.gz
	https://github.com/boltdb/bolt/archive/2f1ce7a837dcb8da3ec595b1dac9d0632f0f99e8.tar.gz -> boltdb-bolt-2f1ce7a837dcb8da3ec595b1dac9d0632f0f99e8.tar.gz
	https://github.com/cespare/xxhash/archive/5c37fe3735342a2e0d01c87a907579987c8936cc.tar.gz -> cespare-xxhash-5c37fe3735342a2e0d01c87a907579987c8936cc.tar.gz
	https://github.com/davecgh/go-spew/archive/346938d642f2ec3594ed81d874461961cd0faa76.tar.gz -> davecgh-go-spew-346938d642f2ec3594ed81d874461961cd0faa76.tar.gz
	https://github.com/dgrijalva/jwt-go/archive/06ea1031745cb8b3dab3f6a236daf2b0aa468b7e.tar.gz -> dgrijalva-jwt-go-06ea1031745cb8b3dab3f6a236daf2b0aa468b7e.tar.gz
	https://github.com/dgryski/go-bitstream/archive/3522498ce2c8ea06df73e55df58edfbfb33cfdd6.tar.gz -> dgryski-go-bitstream-3522498ce2c8ea06df73e55df58edfbfb33cfdd6.tar.gz
	https://github.com/glycerine/go-unsnap-stream/archive/9f0cb55181dd3a0a4c168d3dbc72d4aca4853126.tar.gz -> glycerine-go-unsnap-stream-9f0cb55181dd3a0a4c168d3dbc72d4aca4853126.tar.gz
	https://github.com/gogo/protobuf/archive/636bf0302bc95575d69441b25a2603156ffdddf1.tar.gz -> gogo-protobuf-636bf0302bc95575d69441b25a2603156ffdddf1.tar.gz
	https://github.com/golang/protobuf/archive/b4deda0973fb4c70b50d226b1af49f3da59f5265.tar.gz -> golang-protobuf-b4deda0973fb4c70b50d226b1af49f3da59f5265.tar.gz
	https://github.com/golang/snappy/archive/d9eb7a3d35ec988b8585d4a0068e462c27d28380.tar.gz -> golang-snappy-d9eb7a3d35ec988b8585d4a0068e462c27d28380.tar.gz
	https://github.com/google/go-cmp/archive/3af367b6b30c263d47e8895973edcca9a49cf029.tar.gz -> google-go-cmp-3af367b6b30c263d47e8895973edcca9a49cf029.tar.gz
	https://github.com/influxdata/influxql/archive/c661ab7db8ad858626cc7a2114e786f4e7463564.tar.gz -> influxdata-influxql-c661ab7db8ad858626cc7a2114e786f4e7463564.tar.gz
	https://github.com/influxdata/roaring/archive/fc520f41fab6dcece280e8d4853d87a09a67f9e0.tar.gz -> influxdata-roaring-fc520f41fab6dcece280e8d4853d87a09a67f9e0.tar.gz
	https://github.com/influxdata/usage-client/archive/6d3895376368aa52a3a81d2a16e90f0f52371967.tar.gz -> influxdata-usage-client-6d3895376368aa52a3a81d2a16e90f0f52371967.tar.gz
	https://github.com/jsternberg/zap-logfmt/archive/ac4bd917e18a4548ce6e0e765b29a4e7f397b0b6.tar.gz -> jsternberg-zap-logfmt-ac4bd917e18a4548ce6e0e765b29a4e7f397b0b6.tar.gz
	https://github.com/jwilder/encoding/archive/b4e1701a28efcc637d9afcca7d38e495fe909a09.tar.gz -> jwilder-encoding-b4e1701a28efcc637d9afcca7d38e495fe909a09.tar.gz
	https://github.com/klauspost/compress/archive/b939724e787a27c0005cabe3f78e7ed7987ac74f.tar.gz -> klauspost-compress-b939724e787a27c0005cabe3f78e7ed7987ac74f.tar.gz
	https://github.com/klauspost/cpuid/archive/ae7887de9fa5d2db4eaa8174a7eff2c1ac00f2da.tar.gz -> klauspost-cpuid-ae7887de9fa5d2db4eaa8174a7eff2c1ac00f2da.tar.gz
	https://github.com/klauspost/crc32/archive/cb6bfca970f6908083f26f39a79009d608efd5cd.tar.gz -> klauspost-crc32-cb6bfca970f6908083f26f39a79009d608efd5cd.tar.gz
	https://github.com/klauspost/pgzip/archive/0bf5dcad4ada2814c3c00f996a982270bb81a506.tar.gz -> klauspost-pgzip-0bf5dcad4ada2814c3c00f996a982270bb81a506.tar.gz
	https://github.com/mattn/go-isatty/archive/6ca4dbf54d38eea1a992b3c722a76a5d1c4cb25c.tar.gz -> mattn-go-isatty-6ca4dbf54d38eea1a992b3c722a76a5d1c4cb25c.tar.gz
	https://github.com/mattn/go-runewidth/archive/9e777a8366cce605130a531d2cd6363d07ad7317.tar.gz -> mattn-go-runewidth-9e777a8366cce605130a531d2cd6363d07ad7317.tar.gz
	https://github.com/matttproud/golang_protobuf_extensions/archive/c12348ce28de40eed0136aa2b644d0ee0650e56c.tar.gz -> matttproud-golang_protobuf_extensions-c12348ce28de40eed0136aa2b644d0ee0650e56c.tar.gz
	https://github.com/mschoch/smat/archive/90eadee771aeab36e8bf796039b8c261bebebe4f.tar.gz -> mschoch-smat-90eadee771aeab36e8bf796039b8c261bebebe4f.tar.gz
	https://github.com/opentracing/opentracing-go/archive/bd9c3193394760d98b2fa6ebb2291f0cd1d06a7d.tar.gz -> opentracing-opentracing-go-bd9c3193394760d98b2fa6ebb2291f0cd1d06a7d.tar.gz
	https://github.com/paulbellamy/ratecounter/archive/524851a93235ac051e3540563ed7909357fe24ab.tar.gz -> paulbellamy-ratecounter-524851a93235ac051e3540563ed7909357fe24ab.tar.gz
	https://github.com/peterh/liner/archive/8c1271fcf47f341a9e6771872262870e1ad7650c.tar.gz -> peterh-liner-8c1271fcf47f341a9e6771872262870e1ad7650c.tar.gz
	https://github.com/philhofer/fwd/archive/bb6d471dc95d4fe11e432687f8b70ff496cf3136.tar.gz -> philhofer-fwd-bb6d471dc95d4fe11e432687f8b70ff496cf3136.tar.gz
	https://github.com/prometheus/client_golang/archive/661e31bf844dfca9aeba15f27ea8aa0d485ad212.tar.gz -> prometheus-client_golang-661e31bf844dfca9aeba15f27ea8aa0d485ad212.tar.gz
	https://github.com/prometheus/client_model/archive/5c3871d89910bfb32f5fcab2aa4b9ec68e65a99f.tar.gz -> prometheus-client_model-5c3871d89910bfb32f5fcab2aa4b9ec68e65a99f.tar.gz
	https://github.com/prometheus/common/archive/7600349dcfe1abd18d72d3a1770870d9800a7801.tar.gz -> prometheus-common-7600349dcfe1abd18d72d3a1770870d9800a7801.tar.gz
	https://github.com/prometheus/procfs/archive/ae68e2d4c00fed4943b5f6698d504a5fe083da8a.tar.gz -> prometheus-procfs-ae68e2d4c00fed4943b5f6698d504a5fe083da8a.tar.gz
	https://github.com/retailnext/hllpp/archive/101a6d2f8b52abfc409ac188958e7e7be0116331.tar.gz -> retailnext-hllpp-101a6d2f8b52abfc409ac188958e7e7be0116331.tar.gz
	https://github.com/tinylib/msgp/archive/b2b6a672cf1e5b90748f79b8b81fc8c5cf0571a1.tar.gz -> tinylib-msgp-b2b6a672cf1e5b90748f79b8b81fc8c5cf0571a1.tar.gz
	https://github.com/willf/bitset/archive/d860f346b89450988a379d7d705e83c58d1ea227.tar.gz -> willf-bitset-d860f346b89450988a379d7d705e83c58d1ea227.tar.gz
	https://github.com/xlab/treeprint/archive/d6fb6747feb6e7cfdc44682a024bddf87ef07ec2.tar.gz -> xlab-treeprint-d6fb6747feb6e7cfdc44682a024bddf87ef07ec2.tar.gz
	https://github.com/uber-go/atomic/archive/1ea20fb1cbb1cc08cbd0d913a96dead89aa18289.tar.gz -> uber-go-atomic-1ea20fb1cbb1cc08cbd0d913a96dead89aa18289.tar.gz
	https://github.com/uber-go/multierr/archive/3c4937480c32f4c13a875a1829af76c98ca3d40a.tar.gz -> uber-go-multierr-3c4937480c32f4c13a875a1829af76c98ca3d40a.tar.gz
	https://github.com/uber-go/zap/archive/4d45f9617f7d90f7a663ff21c7a4321dbe78098b.tar.gz -> uber-go-zap-4d45f9617f7d90f7a663ff21c7a4321dbe78098b.tar.gz
	https://github.com/golang/crypto/archive/a2144134853fc9a27a7b1e3eb4f19f1a76df13c9.tar.gz -> golang-crypto-a2144134853fc9a27a7b1e3eb4f19f1a76df13c9.tar.gz
	https://github.com/golang/net/archive/a680a1efc54dd51c040b3b5ce4939ea3cf2ea0d1.tar.gz -> golang-net-a680a1efc54dd51c040b3b5ce4939ea3cf2ea0d1.tar.gz
	https://github.com/golang/sync/archive/1d60e4601c6fd243af51cc01ddf169918a5407ca.tar.gz -> golang-sync-1d60e4601c6fd243af51cc01ddf169918a5407ca.tar.gz
	https://github.com/golang/sys/archive/ac767d655b305d4e9612f5f6e33120b9176c4ad4.tar.gz -> golang-sys-ac767d655b305d4e9612f5f6e33120b9176c4ad4.tar.gz
	https://github.com/golang/text/archive/f21a4dfb5e38f5895301dc265a8def02365cc3d0.tar.gz -> golang-text-f21a4dfb5e38f5895301dc265a8def02365cc3d0.tar.gz
	https://github.com/golang/time/archive/fbb02b2291d28baffd63558aa44b4b56f178d650.tar.gz -> golang-time-fbb02b2291d28baffd63558aa44b4b56f178d650.tar.gz
	https://github.com/google/go-genproto/archive/fedd2861243fd1a8152376292b921b394c7bef7e.tar.gz -> google-go-genproto-fedd2861243fd1a8152376292b921b394c7bef7e.tar.gz
	https://github.com/grpc/grpc-go/archive/168a6198bcb0ef175f7dacec0b8691fc141dc9b8.tar.gz -> grpc-grpc-go-168a6198bcb0ef175f7dacec0b8691fc141dc9b8.tar.gz
	https://github.com/influxdata/flux/archive/8c9d0ad49204d3bbb171e96d872cf663ee7f1b4d.tar.gz -> influxdata-flux-8c9d0ad49204d3bbb171e96d872cf663ee7f1b4d.tar.gz
	https://github.com/influxdata/platform/archive/0f79e4ea3248354c789cba274542e0a8e55971db.tar.gz -> influxdata-platform-0f79e4ea3248354c789cba274542e0a8e55971db.tar.gz
	https://github.com/influxdata/line-protocol/archive/32c6aa80de5eb09d190ad284a8214a531c6bce57.tar.gz -> influxdata-line-protocol-32c6aa80de5eb09d190ad284a8214a531c6bce57.tar.gz
	https://github.com/influxdata/tdigest/archive/a7d76c6f093a59b94a01c6c2b8429122d444a8cc.tar.gz -> influxdata-tdigest-a7d76c6f093a59b94a01c6c2b8429122d444a8cc.tar.gz
	https://github.com/apache/arrow/archive/c6d97c59ef047cc9d5e2836b1945df26cd7c4622.tar.gz -> apache-arrow-c6d97c59ef047cc9d5e2836b1945df26cd7c4622.tar.gz
	https://github.com/c-bata/go-prompt/archive/e99fbc797b795e0a7a94affc8d44f6a0350d85f0.tar.gz -> c-bata-go-prompt-e99fbc797b795e0a7a94affc8d44f6a0350d85f0.tar.gz
	https://github.com/go-sql-driver/mysql/archive/d523deb1b23d913de5bdada721a6071e71283618.tar.gz -> go-sql-driver-mysql-d523deb1b23d913de5bdada721a6071e71283618.tar.gz
	https://github.com/lib/pq/archive/4ded0e9383f75c197b3a2aaa6d590ac52df6fd79.tar.gz -> lib-pq-4ded0e9383f75c197b3a2aaa6d590ac52df6fd79.tar.gz
	https://github.com/pkg/errors/archive/645ef00459ed84a119197bfb8d8205042c6df63d.tar.gz -> pkg-errors-645ef00459ed84a119197bfb8d8205042c6df63d.tar.gz
	https://github.com/satori/go.uuid/archive/f58768cc1a7a7e77a3bd49e98cdd21419399b6a3.tar.gz -> satori-go.uuid-f58768cc1a7a7e77a3bd49e98cdd21419399b6a3.tar.gz
	https://github.com/pkg/term/archive/bffc007b7fd5a70e20e28f5b7649bb84671ef436.tar.gz -> pkg-term-bffc007b7fd5a70e20e28f5b7649bb84671ef436.tar.gz
	https://github.com/segmentio/kafka-go/archive/c6db9435477f3cb658e2dd0fa93e02118c870251.tar.gz -> segmentio-kafka-go-c6db9435477f3cb658e2dd0fa93e02118c870251.tar.gz
	https://github.com/RoaringBitmap/roaring/archive/3d677d3262197ee558b85029301eb69b8239f91a.tar.gz -> RoaringBitmap-roaring-3d677d3262197ee558b85029301eb69b8239f91a.tar.gz"


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
	_golang-include-src github.com/influxdata/roaring influxdata-roaring-*.tar.gz
	_golang-include-src github.com/influxdata/usage-client influxdata-usage-client-*.tar.gz
	_golang-include-src github.com/jsternberg/zap-logfmt jsternberg-zap-logfmt-*.tar.gz
	_golang-include-src github.com/jwilder/encoding jwilder-encoding-*.tar.gz
	_golang-include-src github.com/klauspost/compress klauspost-compress-*.tar.gz
	_golang-include-src github.com/klauspost/cpuid klauspost-cpuid-*.tar.gz
	_golang-include-src github.com/klauspost/crc32 klauspost-crc32-*.tar.gz
	_golang-include-src github.com/klauspost/pgzip klauspost-pgzip-*.tar.gz
	_golang-include-src github.com/mattn/go-isatty mattn-go-isatty-*.tar.gz
	_golang-include-src github.com/mattn/go-runewidth mattn-go-runewidth-*.tar.gz
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
	_golang-include-src google.golang.org/genproto google-go-genproto-*.tar.gz
	_golang-include-src google.golang.org/grpc grpc-grpc-go-*.tar.gz
	_golang-include-src github.com/influxdata/flux influxdata-flux-*.tar.gz
	_golang-include-src github.com/influxdata/platform influxdata-platform-*.tar.gz
	_golang-include-src github.com/influxdata/line-protocol influxdata-line-protocol-*.tar.gz
	_golang-include-src github.com/influxdata/tdigest influxdata-tdigest-*.tar.gz
	_golang-include-src github.com/apache/arrow apache-arrow-*.tar.gz
	_golang-include-src github.com/c-bata/go-prompt c-bata-go-prompt-*.tar.gz
	_golang-include-src github.com/go-sql-driver/mysql go-sql-driver-mysql-*.tar.gz
	_golang-include-src github.com/lib/pq lib-pq-*.tar.gz
	_golang-include-src github.com/pkg/errors pkg-errors-*.tar.gz
	_golang-include-src github.com/satori/go.uuid satori-go.uuid-*.tar.gz
	_golang-include-src github.com/pkg/term pkg-term-*.tar.gz
	_golang-include-src github.com/segmentio/kafka-go segmentio-kafka-go-*.tar.gz
	_golang-include-src github.com/RoaringBitmap/roaring RoaringBitmap-roaring-*.tar.gz
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
