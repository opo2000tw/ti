/*
 * Copyright (c) 2015-2018, Texas Instruments Incorporated
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 *
 * *  Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 *
 * *  Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and/or other materials provided with the distribution.
 *
 * *  Neither the name of Texas Instruments Incorporated nor the names of
 *    its contributors may be used to endorse or promote products derived
 *    from this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
 * THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
 * PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR
 * CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
 * EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
 * PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
 * OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
 * WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
 * OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
 * EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

#ifndef ti_sysbios_family_arm_m3_Hwi__epilogue__include
#define ti_sysbios_family_arm_m3_Hwi__epilogue__include

#ifdef __cplusplus
extern "C" {
#endif

#ifndef ti_sysbios_Build_useHwiMacros

/* Use function call implementations */

/*
 *  ======== Hwi_disable ========
 */
#define ti_sysbios_family_arm_m3_Hwi_disable() ti_sysbios_family_arm_m3_Hwi_disableFxn()

/*
 *  ======== Hwi_enable ========
 */
#define ti_sysbios_family_arm_m3_Hwi_enable() ti_sysbios_family_arm_m3_Hwi_enableFxn()

/*
 *  ======== Hwi_restore ========
 */
#define ti_sysbios_family_arm_m3_Hwi_restore(key) ti_sysbios_family_arm_m3_Hwi_restoreFxn(key)

#else /* ti_sysbios_Build_useHwiMacros */

/* Use macro/inline implementations */

#if defined(__ti__) && !defined(__clang__)

/* declare compiler intrinsic function since compiler doesn't have prototype */
extern unsigned int _set_interrupt_priority(unsigned int);

/*
 *  ======== Hwi_disable ========
 */
#define ti_sysbios_family_arm_m3_Hwi_disable() _set_interrupt_priority(ti_sysbios_family_arm_m3_Hwi_disablePriority)

/*
 *  ======== Hwi_enable ========
 */
#define ti_sysbios_family_arm_m3_Hwi_enable() _set_interrupt_priority(0) 

/*
 *  ======== Hwi_restore ========
 */
#define ti_sysbios_family_arm_m3_Hwi_restore(key) (Void)_set_interrupt_priority(key) 

#else /* defined(__ti__) */

#if defined(__IAR_SYSTEMS_ICC__)
#include <intrinsics.h>

/*
 *  ======== Hwi_disable ========
 */
static inline UInt ti_sysbios_family_arm_m3_Hwi_disable()
{
    UInt key;

	key = __get_BASEPRI();
     __set_BASEPRI(ti_sysbios_family_arm_m3_Hwi_disablePriority);

    return key;
}

/*
 *  ======== Hwi_enable ========
 */
static inline UInt ti_sysbios_family_arm_m3_Hwi_enable()
{
    UInt key;
	key = __get_BASEPRI();
     __set_BASEPRI(0);

    return key;
}

/*
 *  ======== Hwi_restore ========
 */
static inline Void ti_sysbios_family_arm_m3_Hwi_restore(UInt key)
{
     __set_BASEPRI(key);
}

#else  /* clang or GNU */

/*
 *  ======== Hwi_disable ========
 */
static inline UInt ti_sysbios_family_arm_m3_Hwi_disable()
{
    UInt key;

    __asm__ __volatile__ (
            "mrs %0, basepri\n\t"
            "msr basepri, %1"
            : "=&r" (key)
            : "r" (ti_sysbios_family_arm_m3_Hwi_disablePriority)
            );
    return key;
}

/*
 *  ======== Hwi_enable ========
 */
static inline UInt ti_sysbios_family_arm_m3_Hwi_enable()
{
    UInt key;

    __asm__ __volatile__ (
            "movw r12, #0\n\t"
            "mrs %0, basepri\n\t"
            "msr basepri, r12"
            : "=r" (key)
            :: "r12"
            );
    return key;
}

/*
 *  ======== Hwi_restore ========
 */
static inline Void ti_sysbios_family_arm_m3_Hwi_restore(UInt key)
{
    __asm__ __volatile__ (
            "msr basepri, %0"
            :: "r" (key)
            );
}

#endif

#endif /* defined(__ti__) */

#endif /* ti_sysbios_Build_useHwiMacros */

#ifdef __cplusplus
}
#endif

#endif /* ti_sysbios_family_arm_m3_Hwi__epilogue__include */
