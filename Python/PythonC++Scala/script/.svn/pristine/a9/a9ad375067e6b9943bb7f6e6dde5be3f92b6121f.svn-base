#!/usr/bin/python2.7
# -*- coding: utf-8 -*-

import sys
import os
from distutils.core import setup

sys.path.append(os.path.join(os.getcwd(), 'trunk'))

PACKAGE = 'dfhspider'
NAME = 'dfhspider'
DESCRIPTION = 'dfhspider'
AUTHOR = 'Lannik Cooper'
AUTHOR_EMAIL = 'lannikcooper@gmail.com'
URL = 'http://ibbd.net'
VERSION = __import__(PACKAGE).__version__

setup(
    name=NAME,
    version=VERSION,
    description=DESCRIPTION,
    author=AUTHOR,
    author_email=AUTHOR_EMAIL,
    packages=[PACKAGE],
    package_dir={PACKAGE: 'trunk/dfhspider'},
    package_data={PACKAGE: ["setting.yaml"]},
    license='None',
    platforms=['CentOS', 'Ubuntu', 'Windows'],
    url=URL,
)

PACKAGE = 'ibbdlib'
NAME = 'ibbdlib'
DESCRIPTION = 'ibbdlib'
VERSION = __import__(PACKAGE).__version__

setup(
    name=NAME,
    version=VERSION,
    description=DESCRIPTION,
    author=AUTHOR,
    author_email=AUTHOR_EMAIL,
    packages=[PACKAGE],
    package_dir={PACKAGE: 'trunk/ibbdlib'},
    license='None',
    platforms=['CentOS', 'Ubuntu', 'Windows'],
    url=URL,
)

PACKAGE = 'topapi'
NAME = 'topapi'
DESCRIPTION = 'topapi'
VERSION = __import__(PACKAGE).version

setup(
    name=NAME,
    version=VERSION,
    description=DESCRIPTION,
    author=AUTHOR,
    author_email=AUTHOR_EMAIL,
    packages=[PACKAGE],
    package_dir={PACKAGE: 'trunk/topapi'},
    license='None',
    platforms=['CentOS', 'Ubuntu', 'Windows'],
    url=URL,
)