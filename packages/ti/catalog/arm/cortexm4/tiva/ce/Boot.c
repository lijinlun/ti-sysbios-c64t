/*
 * Copyright (c) 2013, Texas Instruments Incorporated
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
 * */
/*
 *  ======== Boot.c ========
 */

#include <xdc/std.h>
#include <xdc/runtime/Assert.h>

#ifndef bool
#define bool Bool
#endif
#ifndef uint32_t
#define uint32_t UInt32
#endif
#ifndef int32_t
#define int32_t Int32
#endif

#include "hw_sysctl.h"
#include "hw_types.h"
#include "sysctl.h"

#include "package/internal/Boot.xdc.h"

/*
 *  ======== Boot_sysCtlClockSet ========
 */
Void Boot_sysCtlClockSet(ULong ulConfig)
{
    /* Confirm that this device uses this algorithm */
    Assert_isTrue(((HWREG(SYSCTL_DID0) & SYSCTL_DID0_CLASS_M)
                        < SYSCTL_DID0_CLASS_TM4C129),
                        Boot_A_mustUseEnhancedClockMode);

    Boot_sysCtlClockSetI(ulConfig);
}


/*
 *  ======== Boot_sysCtlClockFreqSet ========
 */
ULong Boot_sysCtlClockFreqSet(ULong ulConfig, ULong ulSysClock)
{

    /* Confirm that this device uses this algorithm */
    Assert_isTrue(((HWREG(SYSCTL_DID0) & SYSCTL_DID0_CLASS_M)
                        >= SYSCTL_DID0_CLASS_TM4C129),
                        Boot_A_mustNotUseEnhancedClockMode);

    return (Boot_sysCtlClockFreqSetI(ulConfig, ulSysClock));
}

