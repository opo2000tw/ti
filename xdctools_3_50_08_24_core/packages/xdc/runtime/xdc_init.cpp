/* 
 *  Copyright (c) 2008-2017 Texas Instruments Incorporated
 *  This program and the accompanying materials are made available under the
 *  terms of the Eclipse Public License v1.0 and Eclipse Distribution License
 *  v. 1.0 which accompanies this distribution. The Eclipse Public License is
 *  available at http://www.eclipse.org/legal/epl-v10.html and the Eclipse
 *  Distribution License is available at
 *  http://www.eclipse.org/org/documents/edl-v10.php.
 *
 *  Contributors:
 *      Texas Instruments - initial implementation
 * */
/*
 *  ======== xdc_init.cpp ========
 *  This is a C++ file to portably ensure that module initialization occurs
 *  *before* main() is called.
 */

/*
 *  ======== xdc_runtime_Startup_exec__E ========
 *  This function is defined in this package's generated file
 *  package/package.c.  It calls the "real" startup function
 *  xdc_runtime_Startup_exec__F() which is generated by Startup.xdt.
 */

#include <xdc/std.h>

extern "C" void xdc_runtime_Startup_exec__E();

/*
 *  ======== __xdc__init ========
 *  This function performs the initialization of all used modules
 */
extern "C" int  __xdc__init(void)
{
    xdc_runtime_Startup_exec__E();
    return (0);
}

/*
 *  ======== __dummy ========
 *  This one statically initialized variable is required to force C++ to
 *  run __xdc__init() before main().
 */
static __FAR__ volatile int __dummy = __xdc__init();

/*
 *  @(#) xdc.runtime; 2, 1, 0,0; 7-31-2018 11:49:30; /db/ztree/library/trees/xdc/xdc-E10/src/packages/
 */
