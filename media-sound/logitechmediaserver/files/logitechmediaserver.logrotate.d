# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/media-sound/squeezeboxserver/files/squeezeboxserver.logrotate.d,v 1.1 2009/11/25 22:52:25 lavajoe Exp $

/var/log/logitechmediaserver/scanner.log /var/log/logitechmediaserver/server.log /var/log/logitechmediaserver/perfmon.log {
	missingok
	notifempty
	copytruncate
	rotate 5
	size 100k
}
