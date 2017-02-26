# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

DESCRIPTION="Exports physical and virtual server performance metrics using the sFlow protocol"
HOMEPAGE="http://www.sflow.net"
SRC_URI="https://github.com/sflow/host-sflow/archive/v${PVR/r/}.tar.gz -> ${P}.tar.gz"

LICENSE="APL-1.0"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="ulog nflog pcap +tcp docker +kvm xen nvml +ovs cumulus +dbus systemd"

DEPEND=""
RDEPEND="${DEPEND}"

S="${WORKDIR}/host-sflow-${PVR/r/}"

src_compile() {
   local my_config

   my_config=""
   if use ulog ; then my_config="ULOG" ; fi
   if use nflog ; then my_config="${my_config} NFLOG" ; fi
   if use pcap ; then my_config="${my_config} PCAP" ; fi
   if use tcp ; then my_config="${my_config} TCP" ; fi
   if use docker ; then my_config="${my_config} DOCKER" ; fi
   if use kvm ; then my_config="${my_config} KVM" ; fi
   if use xen ; then my_config="${my_config} XEN" ; fi
   if use nvml ; then my_config="${my_config} NVML" ; fi
   if use ovs ; then my_config="${my_config} OVS" ; fi
   if use cumulus ; then my_config="${my_config} CUMULUS" ; fi
   if use dbus ; then my_config="${my_config} DBUS" ; fi
   if use systemd ; then my_config="${my_config} SYSTEMD" ; fi

   emake FEATURES="${my_config}"
}

src_install() {
	emake install INSTROOT="${D}"
	newconfd "${FILESDIR}/${PN}.confd" "${PN}"
	newinitd "${FILESDIR}/${PN}.initd" "${PN}"
}
