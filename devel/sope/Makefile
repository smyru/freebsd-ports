PORTNAME=		sope
PORTVERSION=		5.11.2
CATEGORIES=		devel gnustep
MASTER_SITES=		https://packages.sogo.nu/sources/
DISTNAME=		SOPE-${PORTVERSION}

MAINTAINER=		acm@FreeBSD.org
COMMENT=		Extensive set of GNUstep web application frameworks
WWW=			https://sogo.nu/

LICENSE=		LGPL20

LIB_DEPENDS=		libmemcached.so:databases/libmemcached

USES=			gmake gnome iconv gnustep
USE_GNOME=		libxml2
USE_GNUSTEP=		base build
USE_LDCONFIG=		${GNUSTEP_LOCAL_LIBRARIES}

CONFIGURE_ARGS=		--with-gnustep --disable-debug --disable-strip
CONFIGURE_ENV+=		CC="${CC}"

LLD_UNSAFE=		yes # PR 230608

CONFLICTS=		sope2

SUB_LIST+=		GNUSTEP_LOCAL_TOOLS=${GNUSTEP_LOCAL_TOOLS} \
			GNUSTEP_MAKEFILES=${GNUSTEP_MAKEFILES}

WRKSRC=			${WRKDIR}/SOPE

OPTIONS_DEFINE=		LDAP MYSQL PGSQL MEMCACHED
OPTIONS_DEFAULT=	LDAP PGSQL MEMCACHED
OPTIONS_SUB=		yes

LDAP_DESC=		Build with LDAP support
MEMCACHED_DESC=		Install memcached
MYSQL_DESC=		Build with MySQL support
PGSQL_DESC=		Build with PostgreSQL support

LDAP_USES=		ldap
MEMCACHED_RUN_DEPENDS=	${LOCALBASE}/bin/memcached:databases/memcached
MYSQL_USES=		mysql
PGSQL_USES=		pgsql

.include <bsd.port.options.mk>

.if ${OPSYS} == FreeBSD
CPPFLAGS+=	-Wno-error=incompatible-function-pointer-types
.endif

post-patch:
	@${REINPLACE_CMD} -e 's|%%LOCALBASE%%|${LOCALBASE}|g' ${WRKSRC}/configure
	@${REINPLACE_CMD} -e 's|gcc|${CC}|g' ${WRKSRC}/sope-core/NGStreams/configure
	@${REINPLACE_CMD} -e 's|LDAP_OPT_ON|1|g' ${WRKSRC}/sope-ldap/NGLdap/NGLdapConnection.m
.for f in config.guess config.sub
	@${CP} ${TEMPLATES}/$f ${WRKSRC}/sope-core/NGStreams/
.endfor

post-patch-LDAP-off:
	@${REINPLACE_CMD} -e '/checkLinking "ldap"/d' ${WRKSRC}/configure

post-patch-MYSQL-off:
	@${REINPLACE_CMD} -e '/checkLinking "mysqlclient"/d' ${WRKSRC}/configure

post-patch-PGSQL-off:
	@${REINPLACE_CMD} -e '/checkLinking "pq"/d' ${WRKSRC}/configure

do-configure:
	cd ${WRKSRC} ; . ${GNUSTEP_MAKEFILES}/GNUstep.sh ; ./configure ${CONFIGURE_ARGS}

.include <bsd.port.mk>
