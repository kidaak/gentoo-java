# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit java-maven java-pkg

DESCRIPTION=""
HOMEPAGE=""
#  svn co http://svn.apache.org/repos/asf/maven/maven-1/plugins/tags/MAVEN_JAVADOC_1_7/ maven-javadoc-plugin-1.7
# tar cjvf maven-javadoc-plugin-1.7-gentoo.tar.bz2 maven-javadoc-plugin-1.7/
SRC_URI="http://gentooexperimental.org/distfiles/${P}-gentoo.tar.bz2"

LICENSE="Apache-2.0"
SLOT="1"
KEYWORDS="~x86"
IUSE=""

DEPEND="virtual/jdk"
RDEPEND="virtual/jre"
S="${WORKDIR}/${P}/javadoc"

src_unpack() {
	unpack ${A}

	cd ${S}
	# This build.xml was generated by 'maven ant', and fixed slightly.
	cp ${FILESDIR}/build-${PV}.xml build.xml

	mkdir -p target/lib
	cd target/lib
	java-pkg_jar-from commons-lang
	java-pkg_jar-from commons-collections
}

src_compile() {
	local antflags="jar -Dnoget=true"
	ant ${antflags} || die "ant failed"
}

src_install() {
	#java-pkg_newjar target/${P}.jar ${PN}.jar
	java-maven_newplugin target/${P}.jar ${PN}.jar
}
