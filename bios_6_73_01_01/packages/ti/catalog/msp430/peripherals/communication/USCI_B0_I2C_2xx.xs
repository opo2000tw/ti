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
 *  ======== USCI_B0_I2C_2xx.xs ========
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

    this.interruptSource[0].registerName = "UCNACKIE";
    this.interruptSource[0].registerDescription = "Not-acknowledge interrupt enable";
    this.interruptSource[0].interruptEnable = false;
    this.interruptSource[0].interruptHandler = false;

    this.interruptSource[1].registerName = "UCSTPIE";
    this.interruptSource[1].registerDescription = "Stop condition interrupt enable";
    this.interruptSource[1].interruptEnable = false;
    this.interruptSource[1].interruptHandler = false;

    this.interruptSource[2].registerName = "UCSTTIE";
    this.interruptSource[2].registerDescription = "Start condition interrupt enable";
    this.interruptSource[2].interruptEnable = false;
    this.interruptSource[2].interruptHandler = false;

    this.interruptSource[3].registerName = "UCALIE";
    this.interruptSource[3].registerDescription = "Arbitration lost interrupt enable";
    this.interruptSource[3].interruptEnable = false;
    this.interruptSource[3].interruptHandler = false;
}

/*
 *  ======== setUCNACKIE ========
 */
function setUCNACKIE(set)
{
    var REGS = this.$module;
    if (set) {
        this.USCI_B0_I2C_2xx.UCB0I2CIE.UCNACKIE = REGS.UCNACKIE;
    }
    else {
        this.USCI_B0_I2C_2xx.UCB0I2CIE.UCNACKIE = REGS.UCNACKIE_OFF;
    }
    return set;
}

/*
 *  ======== getUCNACKIE ========
 */
function getUCNACKIE()
{
    var REGS = this.$module;
    if (this.USCI_B0_I2C_2xx.UCB0I2CIE.UCNACKIE == REGS.UCNACKIE) {
        return true;
    }
    else {
        return false;
    }
}

/*
 *  ======== setUCSTPIE ========
 */
function setUCSTPIE(set)
{
    var REGS = this.$module;
    if (set) {
        this.USCI_B0_I2C_2xx.UCB0I2CIE.UCSTPIE = REGS.UCSTPIE;
    }
    else {
        this.USCI_B0_I2C_2xx.UCB0I2CIE.UCSTPIE = REGS.UCSTPIE_OFF;
    }
    return set;
}

/*
 *  ======== getUCSTPIE ========
 */
function getUCSTPIE()
{
    var REGS = this.$module;
    if (this.USCI_B0_I2C_2xx.UCB0I2CIE.UCSTPIE == REGS.UCSTPIE) {
        return true;
    }
    else {
        return false;
    }
}

/*
 *  ======== setUCSTTIE ========
 */
function setUCSTTIE(set)
{
    var REGS = this.$module;
    if (set) {
        this.USCI_B0_I2C_2xx.UCB0I2CIE.UCSTTIE = REGS.UCSTTIE;
    }
    else {
        this.USCI_B0_I2C_2xx.UCB0I2CIE.UCSTTIE = REGS.UCSTTIE_OFF;
    }
    return set;
}

/*
 *  ======== getUCSTTIE ========
 */
function getUCSTTIE()
{
    var REGS = this.$module;
    if (this.USCI_B0_I2C_2xx.UCB0I2CIE.UCSTTIE == REGS.UCSTTIE) {
        return true;
    }
    else {
        return false;
    }
}

/*
 *  ======== setUCALIE ========
 */
function setUCALIE(set)
{
    var REGS = this.$module;
    if (set) {
        this.USCI_B0_I2C_2xx.UCB0I2CIE.UCALIE = REGS.UCALIE;
    }
    else {
        this.USCI_B0_I2C_2xx.UCB0I2CIE.UCALIE = REGS.UCALIE_OFF;
    }
    return set;
}

/*
 *  ======== getUCALIE ========
 */
function getUCALIE()
{
    var REGS = this.$module;
    if (this.USCI_B0_I2C_2xx.UCB0I2CIE.UCALIE == REGS.UCALIE) {
        return true;
    }
    else {
        return false;
    }
}
