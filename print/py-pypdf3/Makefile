PORTNAME=	pypdf3
PORTVERSION=	1.0.6
PORTREVISION=	1
CATEGORIES=	print python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}
DISTNAME=	PyPDF3-${PORTVERSION}

MAINTAINER=	sunpoet@FreeBSD.org
COMMENT=	Pure Python PDF toolkit
WWW=		https://github.com/sfneal/PyPDF3

LICENSE=	BSD3CLAUSE
LICENSE_FILE=	${WRKSRC}/LICENSE

DEPRECATED=	Upstream repository has been archived on Jul 11, 2024
EXPIRATION_DATE=2025-02-28

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}setuptools>=0:devel/py-setuptools@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}wheel>=0:devel/py-wheel@${PY_FLAVOR}
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}tqdm>=0:misc/py-tqdm@${PY_FLAVOR}

USES=		python
USE_PYTHON=	autoplist concurrent pep517

NO_ARCH=	yes

.include <bsd.port.mk>
