# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

FORTRAN_NEEDED=fortran

inherit alternatives-2 eutils fortran-2 linux-info multilib numeric toolchain-funcs versionator

LAPACKP=lapack-3.8.0.tar.gz

DESCRIPTION="Automatically Tuned Linear Algebra Software"
HOMEPAGE="http://math-atlas.sourceforge.net/"
SRC_URI="mirror://sourceforge/math-atlas/${PN}${PV}.tar.bz2
	fortran? ( lapack? ( http://www.netlib.org/lapack/${LAPACKP} ) )"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~amd64-linux ~x86-linux"
IUSE="+deprecated doc +fortran generic ifko +lapack static-libs skylake_server threads"

REQUIRED_USE="
	deprecated? ( lapack )
	lapack? ( fortran )"

S="${WORKDIR}/ATLAS"

pkg_setup() {
	local _cpufreq
	for _cpufreq in /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor; do
		if [ -f ${_cpufreq} ]; then
			if ! grep -q performance ${_cpufreq}; then
				echo 2> /dev/null performance > ${_cpufreq} || \
					die "${PN} needs all cpu set to performance"
			fi
		fi
	done
	[[ -e /sys/devices/system/cpu/intel_pstate ]] \
		&& die "Intel P-State driver detected. Please reboot with 'intel_pstate=disable' in your cmdline"
	use fortran && fortran-2_pkg_setup
	CONFIG_CHECK="
		!~X86_P4_CLOCKMOD
		!~X86_INTEL_PSTATE
	"
	ERROR_KERNEL_X86_P4_CLOCKMOD="P4 Clockmod frequency scaling influences tuning and needs to be disabled at compile time."
	ERROR_KERNEL_X86_INTEL_PSTATE="Intel Pstate frequency scaling influences tuning and needs to be disabled at compile time."
	linux-info_pkg_setup
}

src_configure() {
	# hack needed to trick the flaky gcc detection
	local mycc="$(type -P $(tc-getCC))"
	[[ ${mycc} == *gcc* ]] && mycc=gcc
	atlas_configure() {
		local myconf=(
			--prefix="${ED}/usr"
			--libdir="${ED}/usr/$(get_libdir)"
			--incdir="${ED}/usr/include"
			--cc="$(tc-getCC)"
			"-D c -DWALL"
			"-C acg '${mycc}'"
			"-F acg '${CFLAGS}'"
			"-Ss pmake '\$(MAKE) ${MAKEOPTS}'"
		)

		# OpenMP shown to decreased performance over POSIX threads
		# (at least in 3.9.x, see atlas-dev mailing list)
		if use threads; then
			if use generic; then # 2 threads is most generic
				myconf+=( "-t 2" "-Si omp 0" )
			else
				myconf+=( "-t -1" "-Si omp 0" )
			fi
		else
			myconf+=( "-t  0" "-Si omp 0" )
		fi

		if use amd64 || use ppc64 || use sparc; then
			if [ ${ABI} = amd64 ] || [ ${ABI} = ppc64 ] || [ ${ABI} = sparc64 ] ; then
				myconf+=( "-b 64" )
			elif [ ${ABI} = x86 ] || [ ${ABI} = ppc ] || [ ${ABI} = sparc32 ] ; then
				myconf+=( "-b 32" )
			elif [ ${ABI} = x32 ] ; then
				myconf+=( "-b 48" )
			else
				myconf+=( "-b 64" )
			fi
		elif use ppc || use x86; then
			myconf+=( "-b 32" )
		elif use ia64; then
			myconf+=( "-b 64" )
		fi
		if use fortran; then
			myconf+=(
				"-C if '$(type -P $(tc-getFC))'"
				"-F if '-fno-optimize-sibling-calls ${FFLAGS}'"
			)
			if use lapack; then
				myconf+=(
					"-Si latune 1"
					"--with-netlib-lapack-tarfile=${DISTDIR}/${LAPACKP}"
				)
			else
				myconf+=( "-Si latune 0" )
			fi
		else
			myconf+=( "-Si latune 0" "--nof77" )
		fi
		# generic stuff found by make make xprint_enums in atlas build dir
		# basically assuming sse2+sse1 and 2 threads max
		use generic && use x86   && myconf+=( "-V 384 -A 13")
		use generic && use amd64 && myconf+=( "-V 384 -A 24")
		use skylake_server && myconf+=( "-V 1920 -A 33")

		local confdir="${S}_${1}"; shift
		myconf+=( $(usex ifko "--use-ifko" "") )
		myconf+=( $@ )
		mkdir "${confdir}" && cd "${confdir}" || die
		# for debugging
		echo ${myconf[@]} > myconf.out
		"${S}"/configure ${myconf[@]} || die "configure in ${confdir} failed"

		if use deprecated; then
			echo "BUILD_DEPRECATED=1" >> src/lapack/reference/make.inc.example || die
		fi
	}

	atlas_configure shared "-Fa alg -fPIC" ${EXTRA_ECONF}
	use static-libs && atlas_configure static ${EXTRA_ECONF}
}

src_compile() {
	atlas_compile() {
		pushd "${S}_${1}" > /dev/null || die
		# atlas does its own parallel builds
		emake -j1 build
		cd lib || die
		emake libclapack.a
		[[ -e libptcblas.a ]] && emake libptclapack.a
		popd > /dev/null || die
	}

	atlas_compile shared
	use static-libs && atlas_compile static
}

src_test() {
	cd "${S}_shared" || die
	emake -j1 check time
}

# transform a static archive into a shared library and install them
# atlas_install_libs <mylib.a> [extra link flags]
atlas_install_libs() {
	local libname=$(basename ${1%.*})
	einfo "Installing ${libname}"
	local soname=${libname}.so.$(get_major_version)
	local _cmd
	shift
	pushd "${S}_shared"/lib > /dev/null
	_cmd="${LINK:-$(tc-getCC)}"
	_cmd+=" ${LDFLAGS} -shared -Wl,--no-undefined -Wl,-soname=${soname}"
	_cmd+=" -Wl,--whole-archive ${libname}.a -Wl,--no-whole-archive"
	_cmd+=" $@ -o ${soname}"
	einfo "${_cmd}"
	${_cmd} || die "Creating ${soname} failed"
	dolib.so ${soname}
	dosym ${soname} /usr/$(get_libdir)/${soname%.*}
	popd > /dev/null || die
	use static-libs && dolib.a "${S}_static"/lib/${libname}.a
}

# create and install a pkgconfig file
# atlas_install_pc <libname> <pkg name> [extra link flags]
atlas_install_pc() {
	local libname=${1} ; shift
	local pcname=${1} ; shift
	local extra=()
	[[ ${PCREQ} ]] && extra+=( --requires "${PCREQ}" )
	create_pkgconfig \
		--name "${pcname}" \
		--description "${PN} ${pcname}" \
		--libs "-L\${libdir} -l${libname} $@" \
		--libs-private "-L\${libdir} -latlas -lm ${PTLIBS}" \
		--cflags "-I\${includedir}/${PN}" \
		"${extra[@]}" \
		${pcname}
}

src_install() {
	cd "${S}_shared/lib" || die
	# rename to avoid collision with other packages
	local l
	for l in {,c}{blas,lapack}; do
		if [[ -e lib${l}.a ]]; then
			mv lib{,atl}${l}.a || die
			if use static-libs; then
				mv "${S}"_static/lib/lib{,atl}${l}.a || die
			fi
		fi
	done

	[[ -e libptcblas.a ]] && PTLIBS="-lpthread"

	# atlas
	atlas_install_libs libatlas.a -lm ${PTLIBS}

	# cblas
	atlas_install_libs libatlcblas.a -L. -latlas -lm
	atlas_install_pc atlcblas atlas-cblas
	alternatives_for cblas atlas 0 \
		/usr/$(get_libdir)/pkgconfig/cblas.pc atlas-cblas.pc \
		/usr/include/cblas.h atlas/cblas.h

	# cblas threaded
	if [[ -e libptcblas.a ]]; then
		atlas_install_libs libptcblas.a -L. -latlas -lm ${PTLIBS}
		atlas_install_pc ptcblas atlas-cblas-threads
		alternatives_for cblas atlas-threads 0 \
			/usr/$(get_libdir)/pkgconfig/cblas.pc atlas-cblas-threads.pc \
			/usr/include/cblas.h atlas/cblas.h
	fi

	if use lapack; then
		PCREQ="cblas"
		# clapack
		atlas_install_libs libatlclapack.a -L. -latlcblas -latlas -lm
		atlas_install_pc atlclapack atlas-clapack

		# clapack threaded
		if [[ -e libptclapack.a ]]; then
			atlas_install_libs libptclapack.a -L. -lptcblas -latlas -lm ${PTLIBS}
			atlas_install_pc ptclapack atlas-clapack-threads
		fi
	fi

	if use fortran; then
		LINK=$(tc-getF77) PCREQ=

		# blas
		atlas_install_libs libf77blas.a -L. -latlas -lm
		atlas_install_pc f77blas atlas-blas
		alternatives_for blas atlas 0 \
			/usr/$(get_libdir)/pkgconfig/blas.pc atlas-blas.pc

		# blas threaded
		if [[ -e libptf77blas.a ]]; then
			atlas_install_libs libptf77blas.a -L. -latlas -lm ${PTLIBS}
			atlas_install_pc ptf77blas atlas-blas-threads
			alternatives_for blas atlas-threads 0 \
				/usr/$(get_libdir)/pkgconfig/blas.pc atlas-blas-threads.pc
		fi

		if use lapack; then
			PCREQ="blas cblas"
			# lapack
			atlas_install_libs libatllapack.a \
				-L. -latlcblas -lf77blas -latlas -lm
			atlas_install_pc atllapack atlas-lapack
			alternatives_for lapack atlas 0 \
				/usr/$(get_libdir)/pkgconfig/lapack.pc atlas-lapack.pc
			# lapack threaded
			if [[ -e libptlapack.a ]]; then
				atlas_install_libs libptlapack.a \
					-L. -lptcblas -lptf77blas -latlas -lm ${PTLIBS}
				atlas_install_pc ptlapack atlas-lapack-threads
				alternatives_for lapack atlas-threads 0 \
					/usr/$(get_libdir)/pkgconfig/lapack.pc atlas-lapack-threads.pc
			fi
		fi
	fi

	cd "${S}" || die
	insinto /usr/include/${PN}
	doins include/*.h

	cd "${S}/doc" || die
	dodoc INDEX.txt AtlasCredits.txt ChangeLog
	use doc && dodoc atlas*pdf cblas.pdf cblasqref.pdf
	use doc && use fortran && dodoc f77blas*pdf
	use doc && use fortran && use lapack && dodoc *lapack*pdf
}
