/*
 * CDDL HEADER START
 *
 * The contents of this file are subject to the terms of the
 * Common Development and Distribution License (the "License").
 * You may not use this file except in compliance with the License.
 *
 * You can obtain a copy of the license at usr/src/OPENSOLARIS.LICENSE
 * or http://www.opensolaris.org/os/licensing.
 * See the License for the specific language governing permissions
 * and limitations under the License.
 *
 * When distributing Covered Code, include this CDDL HEADER in each
 * file and include the License file at usr/src/OPENSOLARIS.LICENSE.
 * If applicable, add the following below this CDDL HEADER, with the
 * fields enclosed by brackets "[]" replaced with your own identifying
 * information: Portions Copyright [yyyy] [name of copyright owner]
 *
 * CDDL HEADER END
 */

/*
 * Copyright 2006 Sun Microsystems, Inc.  All rights reserved.
 * Use is subject to license terms.
 */

#pragma ident	"@(#)err.D_OP_PTR.NonPointerAccess.d	1.1	06/08/28 SMI"

/*
 * ASSERTION:
 * Accessing the members of a struct using the pointer notation using a
 * nonpointer variable throws a D_OP_PTR error.
 *
 * SECTION: Structs and Unions/Pointers to Structs
 *
 */

#pragma D option quiet

struct myinput_struct {
	int i;
	char c;
};

struct myinput_struct f;

BEGIN
{
	f.i = 10;
	f.c = 'c';

	printf("f->i: %d\tf->c: %c\n", f->i, f->c);
	exit(0);
}

ERROR
{
	exit(1);
}
