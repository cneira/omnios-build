#!/usr/bin/bash
#
# {{{ CDDL HEADER
#
# This file and its contents are supplied under the terms of the
# Common Development and Distribution License ("CDDL"), version 1.0.
# You may only use this file in accordance with the terms of version
# 1.0 of the CDDL.
#
# A full copy of the text of the CDDL should have accompanied this
# source. A copy of the CDDL is also available via the Internet at
# http://www.illumos.org/license/CDDL.
# }}}
#
# Copyright 2019 OmniOS Community Edition (OmniOSce) Association.

. ../../../lib/functions.sh

PKG=library/python-3/importlib-metadata-37
PROG=importlib-metadata
VER=1.2.0
SUMMARY="Read metadata from Python packages"
DESC="A library to access the metadata for a Python package"

. $SRCDIR/../common.sh

BUILDDIR=${PROG//-/_}-$VER

RUN_DEPENDS_IPS+="
    library/python-$PYMVER/zipp-$SPYVER
"

init
download_source pymodules/$PROG $BUILDDIR
patch_source
prep_build
python_build
make_package
clean_up

# Vim hints
# vim:ts=4:sw=4:et:fdm=marker
