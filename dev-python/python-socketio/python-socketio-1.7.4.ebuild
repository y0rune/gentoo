# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6
PYTHON_COMPAT=( python2_7 python3_{5,6} pypy pypy3 )

inherit distutils-r1

DESCRIPTION="Python implementation of the Socket.IO realtime server."
HOMEPAGE="https://python-socketio.readthedocs.org/ https://github.com/miguelgrinberg/python-socketio/ https://pypi.org/project/python-socketio/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

RDEPEND=">=dev-python/six-1.9.0[${PYTHON_USEDEP}]
	>=dev-python/python-engineio-1.2.1[${PYTHON_USEDEP}]
	!dev-python/gevent-socketio"
DEPEND="${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]
	test? (
		dev-python/mock[${PYTHON_USEDEP}]
	)"

# pypi tarball does not contain tests
RESTRICT="test"

src_prepare() {
	eapply_user
	distutils-r1_src_prepare
}

python_test() {
	esetup.py test || die
}
