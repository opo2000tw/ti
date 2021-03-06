/*
 * Copyright (c) 2016, Texas Instruments Incorporated
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


/*
 *  ======== ADC10_B.xs ========
 */


/*
 *  ======== module$meta$init ========
 */
function module$meta$init()
{
}

/*
 *  ======== instance$meta$init ========
 */
function instance$meta$init(clock)
{
    this.clock = clock;

    this.interruptSource[0].registerName = "ADC10IE0";
    this.interruptSource[0].registerDescription = "ADC10_B Interrupt Enable";
    this.interruptSource[0].interruptEnable = false;
    this.interruptSource[0].interruptHandler = false;

    this.interruptSource[1].registerName = "ADC10HIIE";
    this.interruptSource[1].registerDescription = "ADC10_B Window Comparator High Threshold";
    this.interruptSource[1].interruptEnable = false;
    this.interruptSource[1].interruptHandler = false;

    this.interruptSource[2].registerName = "ADC10LOIE";
    this.interruptSource[2].registerDescription = "ADC10_B Window Comparator Low Threshold";
    this.interruptSource[2].interruptEnable = false;
    this.interruptSource[2].interruptHandler = false;

    this.interruptSource[3].registerName = "ADC10INIE";
    this.interruptSource[3].registerDescription = "ADC10_B Window Comparator In-between Threshold";
    this.interruptSource[3].interruptEnable = false;
    this.interruptSource[3].interruptHandler = false;
}
