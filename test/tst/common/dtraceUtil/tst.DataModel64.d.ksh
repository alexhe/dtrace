#!/bin/ksh

#
# CDDL HEADER START
#
# The contents of this file are subject to the terms of the
# Common Development and Distribution License (the "License").
# You may not use this file except in compliance with the License.
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
# CDDL HEADER END
#

#
# Copyright 2006 Sun Microsystems, Inc.  All rights reserved.
# Use is subject to license terms.
#

#ident	"@(#)tst.DataModel64.d.ksh	1.1	06/08/28 SMI"

##
#
# ASSERTION:
# If the -64 option is specified, dtrace will force the D compiler to
# compile a program using the 64-bit data model.
#
# SECTION: dtrace Utility/-64 Option
#
##

script()
{
##
#	This was the original Solaris invocation.
#
#	$dtrace -64 -s /dev/stdin <<EOF
#	
#	Apple instead uses a -arch flag.
##
	$dtrace -arch x86_64 -s /dev/stdin <<EOF
	BEGIN
	/8 != sizeof(long)/
	{
		printf("Not targeted for 64 bit machine\n");
		exit(1);
	}

	BEGIN
	/8 == sizeof(long)/
	{
		printf("Targeted for 64 bit machine\n");
		exit(0);
	}
EOF
}

dtrace=/usr/sbin/dtrace

script
status=$?

if [ "$status" -ne 0 ]; then
	echo $tst: dtrace failed
fi

exit $status
