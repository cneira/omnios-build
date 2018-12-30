#!/usr/bin/bash
#
# {{{ CDDL HEADER START
#
# The contents of this file are subject to the terms of the
# Common Development and Distribution License, Version 1.0 only
# (the "License").  You may not use this file except in compliance
# with the License.
#
# You can obtain a copy of the license at usr/src/OPENSOLARIS.LICENSE
# or http://www.opensolaris.org/os/licensing.
# See the License for the specific language governing permissions
# and limitations under the License.
#
# When distributing Covered Code, include this CDDL HEADER in each
# file and include the License file at usr/src/OPENSOLARIS.LICENSE.
# If applicable, add the following below this CDDL HEADER, with the
# fields enclosed by brackets "[]" replaced with your own identifying
# information: Portions Copyright [yyyy] [name of copyright owner]
#
# CDDL HEADER END }}}
#
# Copyright 2011-2012 OmniTI Computer Consulting, Inc.  All rights reserved.
# Copyright 2017 OmniOS Community Edition (OmniOSce) Association.
# Use is subject to license terms.
#
. ../../lib/functions.sh

PROG=tar
VER=1.30
PKG=archiver/gnu-tar
SUMMARY="gtar - GNU tar"
DESC="GNU tar - A utility used to store, backup, and transport files (gtar)"

RUN_DEPENDS_IPS="
    system/prerequisite/gnu
    system/extended-system-utilities
    compress/gzip
    compress/bzip2
    compress/xz
"

BUILDARCH=32

CONFIGURE_OPTS="--program-prefix=g --with-rmt=/usr/sbin/rmt"
CONFIGURE_OPTS_32+=" --bindir=/usr/bin"

init
download_source $PROG $PROG $VER
patch_source
# TODO: need to run autoreconf to build sucessfully with patch CVE-2018-20482
# can be removed once it got integrated into a new release
run_autoreconf
prep_build
build
run_testsuite check
make_isa_stub
make_package
clean_up

# Vim hints
# vim:ts=4:sw=4:et:fdm=marker
