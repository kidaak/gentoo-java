# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit jboss-4

DESCRIPTION="Naming module of JBoss Application Server"
GENTOO_CONF="jboss-${PV}-gentoo-r2.data"
SRC_URI="${BASE_URL}/${P}-gentoo.tar.bz2 ${BASE_URL}/${GENTOO_CONF} ${ECLASS_URI}"
HOMEPAGE="http://www.jboss.org"
LICENSE="LGPL-2"
IUSE="jikes"
SLOT="4"
KEYWORDS="~x86"

COMMON_DEPEND="dev-java/junit
	dev-java/log4j
	=dev-java/jboss-module-common-4.0.2*"
DEPEND=">=virtual/jdk-1.3 ${COMMON_DEPEND}"
RDEPEND=">=virtual/jre-1.3 ${COMMON_DEPEND}"

# TODO jikes / 1.5 patch to get change enums
