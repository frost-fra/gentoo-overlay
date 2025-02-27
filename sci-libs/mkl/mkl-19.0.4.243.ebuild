# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

INTEL_DIST_PV=2019_update4_cluster_edition

inherit alternatives-2 intel-sdp-r1 numeric-int64-multibuild

DESCRIPTION="Intel Math Kernel Library: linear algebra, fft, math functions"
HOMEPAGE="http://software.intel.com/en-us/articles/intel-mkl/"

IUSE="doc int64"
KEYWORDS="-* ~amd64 ~x86 ~amd64-linux ~x86-linux"

DEPEND=""
RDEPEND="~dev-libs/intel-common-${PV}[compiler]"

CHECKREQS_DISK_BUILD=3500M

INTEL_DIST_DAT_RPMS=(
	"mkl-cluster-c-2019.4-243-2019.4-243.noarch.rpm"
	"mkl-cluster-f-2019.4-243-2019.4-243.noarch.rpm"
	"mkl-common-2019.4-243-2019.4-243.noarch.rpm"
	"mkl-common-c-2019.4-243-2019.4-243.noarch.rpm"
	"mkl-common-c-ps-2019.4-243-2019.4-243.noarch.rpm"
	"mkl-common-f-2019.4-243-2019.4-243.noarch.rpm"
	"mkl-common-ps-2019.4-243-2019.4-243.noarch.rpm"
	"mkl-f95-common-2019.4-243-2019.4-243.noarch.rpm")
INTEL_DIST_AMD64_RPMS=(
	"mkl-cluster-2019.4-243-2019.4-243.x86_64.rpm"
	"mkl-cluster-rt-2019.4-243-2019.4-243.x86_64.rpm"
	"mkl-core-2019.4-243-2019.4-243.x86_64.rpm"
	"mkl-core-c-2019.4-243-2019.4-243.x86_64.rpm"
	"mkl-core-f-2019.4-243-2019.4-243.x86_64.rpm"
	"mkl-core-ps-2019.4-243-2019.4-243.x86_64.rpm"
	"mkl-core-rt-2019.4-243-2019.4-243.x86_64.rpm"
	"mkl-f95-2019.4-243-2019.4-243.x86_64.rpm"
	"mkl-gnu-2019.4-243-2019.4-243.x86_64.rpm"
	"mkl-gnu-c-2019.4-243-2019.4-243.x86_64.rpm"
	"mkl-gnu-f-2019.4-243-2019.4-243.x86_64.rpm"
	"mkl-gnu-f-rt-2019.4-243-2019.4-243.x86_64.rpm"
	"mkl-gnu-rt-2019.4-243-2019.4-243.x86_64.rpm"
	"mkl-pgi-2019.4-243-2019.4-243.x86_64.rpm"
	"mkl-pgi-c-2019.4-243-2019.4-243.x86_64.rpm"
	"mkl-pgi-rt-2019.4-243-2019.4-243.x86_64.rpm"
	"mkl-tbb-2019.4-243-2019.4-243.x86_64.rpm"
	"mkl-tbb-rt-2019.4-243-2019.4-243.x86_64.rpm")
INTEL_DIST_X86_RPMS=(
	"mkl-core-32bit-2019.4-243-2019.4-243.x86_64.rpm"
	"mkl-core-c-32bit-2019.4-243-2019.4-243.x86_64.rpm"
	"mkl-core-f-32bit-2019.4-243-2019.4-243.x86_64.rpm"
	"mkl-core-ps-32bit-2019.4-243-2019.4-243.x86_64.rpm"
	"mkl-core-rt-32bit-2019.4-243-2019.4-243.x86_64.rpm"
	"mkl-f95-32bit-2019.4-243-2019.4-243.x86_64.rpm"
	"mkl-gnu-32bit-2019.4-243-2019.4-243.x86_64.rpm"
	"mkl-gnu-c-32bit-2019.4-243-2019.4-243.x86_64.rpm"
	"mkl-gnu-f-32bit-2019.4-243-2019.4-243.x86_64.rpm"
	"mkl-gnu-f-rt-32bit-2019.4-243-2019.4-243.x86_64.rpm"
	"mkl-gnu-rt-32bit-2019.4-243-2019.4-243.x86_64.rpm"
	"mkl-tbb-32bit-2019.4-243-2019.4-243.x86_64.rpm"
	"mkl-tbb-rt-32bit-2019.4-243-2019.4-243.x86_64.rpm")

pkg_setup() {
	if use doc; then
		INTEL_DIST_DAT_RPMS+=(
			"mkl-doc-2019-2019.4-243.noarch.rpm"
			"mkl-doc-ps-2019-2019.4-243.noarch.rpm")
	fi
}

_mkl_add_alternative_provider() {
	local prov=$1; shift
	local alt
	for alt in $*; do
		NUMERIC_MODULE_NAME=${prov} \
			numeric-int64-multibuild_install_alternative ${alt} ${prov}
	done
}

src_install() {
	intel-sdp-r1_src_install

	sed -i -e "s#<INSTALLDIR>#$(isdp_get-sdp-edir)/linux#" \
		"${ED}"/opt/intel/compilers_and_libraries_2019.4.243/linux/mkl/bin/pkgconfig/* \
		|| die "sed failed"

	mkdir -p "${ED}"/usr/$(get_libdir)/pkgconfig/ || die "mkdir failed"
	cp "${ED}"/opt/intel/compilers_and_libraries_2019.4.243/linux/mkl/bin/pkgconfig/* \
		"${ED}"/usr/$(get_libdir)/pkgconfig/ || die "cp failed"

	if use int64; then
		_mkl_add_alternative_provider mkl-dynamic-ilp64-seq blas lapack cblas lapacke scalapack
		_mkl_add_alternative_provider mkl-dynamic-ilp64-iomp blas lapack cblas lapacke scalapack
	else
		_mkl_add_alternative_provider mkl-dynamic-lp64-seq blas lapack cblas lapacke scalapack
		_mkl_add_alternative_provider mkl-dynamic-lp64-iomp blas lapack cblas lapacke scalapack
	fi

	local ldpath="LDPATH="
	use abi_x86_64 && ldpath+=":$(isdp_get-sdp-edir)/linux/mkl/lib/$(isdp_convert2intel-arch abi_x86_64)"
	use abi_x86_32 && ldpath+=":$(isdp_get-sdp-edir)/linux/mkl/lib/$(isdp_convert2intel-arch abi_x86_32)"
	echo "${ldpath}" > "${T}"/35mkl || die
	doenvd "${T}"/35mkl
}
