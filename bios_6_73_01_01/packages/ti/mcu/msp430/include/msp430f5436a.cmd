/* ============================================================================ */
/* Copyright (c) 2014, Texas Instruments Incorporated                           */
/*  All rights reserved.                                                        */
/*                                                                              */
/*  Redistribution and use in source and binary forms, with or without          */
/*  modification, are permitted provided that the following conditions          */
/*  are met:                                                                    */
/*                                                                              */
/*  *  Redistributions of source code must retain the above copyright           */
/*     notice, this list of conditions and the following disclaimer.            */
/*                                                                              */
/*  *  Redistributions in binary form must reproduce the above copyright        */
/*     notice, this list of conditions and the following disclaimer in the      */
/*     documentation and/or other materials provided with the distribution.     */
/*                                                                              */
/*  *  Neither the name of Texas Instruments Incorporated nor the names of      */
/*     its contributors may be used to endorse or promote products derived      */
/*     from this software without specific prior written permission.            */
/*                                                                              */
/*  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" */
/*  AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,       */
/*  THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR      */
/*  PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR            */
/*  CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,       */
/*  EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,         */
/*  PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; */
/*  OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,    */
/*  WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR     */
/*  OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,              */
/*  EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.                          */
/* ============================================================================ */

/******************************************************************************/
/* msp430f5436a.cmd                                                           */
/*    - Linker Command File for defintions in the header file                 */
/*    Please do not change !                                                  */
/*                                                                            */
/******************************************************************************/
/* Version: 1.121                                                             */
/******************************************************************************/


/************************************************************
* STANDARD BITS
************************************************************/
/************************************************************
* STATUS REGISTER BITS
************************************************************/
/************************************************************
* CPU
************************************************************/
/************************************************************
* PERIPHERAL FILE MAP
************************************************************/
/************************************************************
* ADC12 PLUS
************************************************************/
ADC12CTL0          = 0x0700;
ADC12CTL0_L        = 0x0700;
ADC12CTL0_H        = 0x0701;
ADC12CTL1          = 0x0702;
ADC12CTL1_L        = 0x0702;
ADC12CTL1_H        = 0x0703;
ADC12CTL2          = 0x0704;
ADC12CTL2_L        = 0x0704;
ADC12CTL2_H        = 0x0705;
ADC12IFG           = 0x070A;
ADC12IFG_L         = 0x070A;
ADC12IFG_H         = 0x070B;
ADC12IE            = 0x070C;
ADC12IE_L          = 0x070C;
ADC12IE_H          = 0x070D;
ADC12IV            = 0x070E;
ADC12IV_L          = 0x070E;
ADC12IV_H          = 0x070F;
ADC12MEM0          = 0x0720;
ADC12MEM0_L        = 0x0720;
ADC12MEM0_H        = 0x0721;
ADC12MEM1          = 0x0722;
ADC12MEM1_L        = 0x0722;
ADC12MEM1_H        = 0x0723;
ADC12MEM2          = 0x0724;
ADC12MEM2_L        = 0x0724;
ADC12MEM2_H        = 0x0725;
ADC12MEM3          = 0x0726;
ADC12MEM3_L        = 0x0726;
ADC12MEM3_H        = 0x0727;
ADC12MEM4          = 0x0728;
ADC12MEM4_L        = 0x0728;
ADC12MEM4_H        = 0x0729;
ADC12MEM5          = 0x072A;
ADC12MEM5_L        = 0x072A;
ADC12MEM5_H        = 0x072B;
ADC12MEM6          = 0x072C;
ADC12MEM6_L        = 0x072C;
ADC12MEM6_H        = 0x072D;
ADC12MEM7          = 0x072E;
ADC12MEM7_L        = 0x072E;
ADC12MEM7_H        = 0x072F;
ADC12MEM8          = 0x0730;
ADC12MEM8_L        = 0x0730;
ADC12MEM8_H        = 0x0731;
ADC12MEM9          = 0x0732;
ADC12MEM9_L        = 0x0732;
ADC12MEM9_H        = 0x0733;
ADC12MEM10         = 0x0734;
ADC12MEM10_L       = 0x0734;
ADC12MEM10_H       = 0x0735;
ADC12MEM11         = 0x0736;
ADC12MEM11_L       = 0x0736;
ADC12MEM11_H       = 0x0737;
ADC12MEM12         = 0x0738;
ADC12MEM12_L       = 0x0738;
ADC12MEM12_H       = 0x0739;
ADC12MEM13         = 0x073A;
ADC12MEM13_L       = 0x073A;
ADC12MEM13_H       = 0x073B;
ADC12MEM14         = 0x073C;
ADC12MEM14_L       = 0x073C;
ADC12MEM14_H       = 0x073D;
ADC12MEM15         = 0x073E;
ADC12MEM15_L       = 0x073E;
ADC12MEM15_H       = 0x073F;
ADC12MCTL0         = 0x0710;
ADC12MCTL1         = 0x0711;
ADC12MCTL2         = 0x0712;
ADC12MCTL3         = 0x0713;
ADC12MCTL4         = 0x0714;
ADC12MCTL5         = 0x0715;
ADC12MCTL6         = 0x0716;
ADC12MCTL7         = 0x0717;
ADC12MCTL8         = 0x0718;
ADC12MCTL9         = 0x0719;
ADC12MCTL10        = 0x071A;
ADC12MCTL11        = 0x071B;
ADC12MCTL12        = 0x071C;
ADC12MCTL13        = 0x071D;
ADC12MCTL14        = 0x071E;
ADC12MCTL15        = 0x071F;
/*************************************************************
* CRC Module
*************************************************************/
CRCDI              = 0x0150;
CRCDI_L            = 0x0150;
CRCDI_H            = 0x0151;
CRCDIRB            = 0x0152;
CRCDIRB_L          = 0x0152;
CRCDIRB_H          = 0x0153;
CRCINIRES          = 0x0154;
CRCINIRES_L        = 0x0154;
CRCINIRES_H        = 0x0155;
CRCRESR            = 0x0156;
CRCRESR_L          = 0x0156;
CRCRESR_H          = 0x0157;
/************************************************************
* DMA_X
************************************************************/
DMACTL0            = 0x0500;
DMACTL0_L          = 0x0500;
DMACTL0_H          = 0x0501;
DMACTL1            = 0x0502;
DMACTL1_L          = 0x0502;
DMACTL1_H          = 0x0503;
DMACTL2            = 0x0504;
DMACTL2_L          = 0x0504;
DMACTL2_H          = 0x0505;
DMACTL3            = 0x0506;
DMACTL3_L          = 0x0506;
DMACTL3_H          = 0x0507;
DMACTL4            = 0x0508;
DMACTL4_L          = 0x0508;
DMACTL4_H          = 0x0509;
DMAIV              = 0x050E;
DMAIV_L            = 0x050E;
DMAIV_H            = 0x050F;
DMA0CTL            = 0x0510;
DMA0CTL_L          = 0x0510;
DMA0CTL_H          = 0x0511;
DMA0SA             = 0x0512;
DMA0SAL            = 0x0512;
DMA0DA             = 0x0516;
DMA0DAL            = 0x0516;
DMA0SZ             = 0x051A;
DMA1CTL            = 0x0520;
DMA1CTL_L          = 0x0520;
DMA1CTL_H          = 0x0521;
DMA1SA             = 0x0522;
DMA1SAL            = 0x0522;
DMA1DA             = 0x0526;
DMA1DAL            = 0x0526;
DMA1SZ             = 0x052A;
DMA2CTL            = 0x0530;
DMA2CTL_L          = 0x0530;
DMA2CTL_H          = 0x0531;
DMA2SA             = 0x0532;
DMA2SAL            = 0x0532;
DMA2DA             = 0x0536;
DMA2DAL            = 0x0536;
DMA2SZ             = 0x053A;
/*************************************************************
* Flash Memory
*************************************************************/
FCTL1              = 0x0140;
FCTL1_L            = 0x0140;
FCTL1_H            = 0x0141;
FCTL3              = 0x0144;
FCTL3_L            = 0x0144;
FCTL3_H            = 0x0145;
FCTL4              = 0x0146;
FCTL4_L            = 0x0146;
FCTL4_H            = 0x0147;
/************************************************************
* HARDWARE MULTIPLIER 32Bit
************************************************************/
MPY                = 0x04C0;
MPY_L              = 0x04C0;
MPY_H              = 0x04C1;
MPYS               = 0x04C2;
MPYS_L             = 0x04C2;
MPYS_H             = 0x04C3;
MAC                = 0x04C4;
MAC_L              = 0x04C4;
MAC_H              = 0x04C5;
MACS               = 0x04C6;
MACS_L             = 0x04C6;
MACS_H             = 0x04C7;
OP2                = 0x04C8;
OP2_L              = 0x04C8;
OP2_H              = 0x04C9;
RESLO              = 0x04CA;
RESLO_L            = 0x04CA;
RESLO_H            = 0x04CB;
RESHI              = 0x04CC;
RESHI_L            = 0x04CC;
RESHI_H            = 0x04CD;
SUMEXT             = 0x04CE;
SUMEXT_L           = 0x04CE;
SUMEXT_H           = 0x04CF;
MPY32L             = 0x04D0;
MPY32L_L           = 0x04D0;
MPY32L_H           = 0x04D1;
MPY32H             = 0x04D2;
MPY32H_L           = 0x04D2;
MPY32H_H           = 0x04D3;
MPYS32L            = 0x04D4;
MPYS32L_L          = 0x04D4;
MPYS32L_H          = 0x04D5;
MPYS32H            = 0x04D6;
MPYS32H_L          = 0x04D6;
MPYS32H_H          = 0x04D7;
MAC32L             = 0x04D8;
MAC32L_L           = 0x04D8;
MAC32L_H           = 0x04D9;
MAC32H             = 0x04DA;
MAC32H_L           = 0x04DA;
MAC32H_H           = 0x04DB;
MACS32L            = 0x04DC;
MACS32L_L          = 0x04DC;
MACS32L_H          = 0x04DD;
MACS32H            = 0x04DE;
MACS32H_L          = 0x04DE;
MACS32H_H          = 0x04DF;
OP2L               = 0x04E0;
OP2L_L             = 0x04E0;
OP2L_H             = 0x04E1;
OP2H               = 0x04E2;
OP2H_L             = 0x04E2;
OP2H_H             = 0x04E3;
RES0               = 0x04E4;
RES0_L             = 0x04E4;
RES0_H             = 0x04E5;
RES1               = 0x04E6;
RES1_L             = 0x04E6;
RES1_H             = 0x04E7;
RES2               = 0x04E8;
RES2_L             = 0x04E8;
RES2_H             = 0x04E9;
RES3               = 0x04EA;
RES3_L             = 0x04EA;
RES3_H             = 0x04EB;
MPY32CTL0          = 0x04EC;
MPY32CTL0_L        = 0x04EC;
MPY32CTL0_H        = 0x04ED;
/************************************************************
* DIGITAL I/O Port1/2 Pull up / Pull down Resistors
************************************************************/
PAIN               = 0x0200;
PAIN_L             = 0x0200;
PAIN_H             = 0x0201;
PAOUT              = 0x0202;
PAOUT_L            = 0x0202;
PAOUT_H            = 0x0203;
PADIR              = 0x0204;
PADIR_L            = 0x0204;
PADIR_H            = 0x0205;
PAREN              = 0x0206;
PAREN_L            = 0x0206;
PAREN_H            = 0x0207;
PADS               = 0x0208;
PADS_L             = 0x0208;
PADS_H             = 0x0209;
PASEL              = 0x020A;
PASEL_L            = 0x020A;
PASEL_H            = 0x020B;
PAIES              = 0x0218;
PAIES_L            = 0x0218;
PAIES_H            = 0x0219;
PAIE               = 0x021A;
PAIE_L             = 0x021A;
PAIE_H             = 0x021B;
PAIFG              = 0x021C;
PAIFG_L            = 0x021C;
PAIFG_H            = 0x021D;
P1IV               = 0x020E;
P2IV               = 0x021E;
/************************************************************
* DIGITAL I/O Port3/4 Pull up / Pull down Resistors
************************************************************/
PBIN               = 0x0220;
PBIN_L             = 0x0220;
PBIN_H             = 0x0221;
PBOUT              = 0x0222;
PBOUT_L            = 0x0222;
PBOUT_H            = 0x0223;
PBDIR              = 0x0224;
PBDIR_L            = 0x0224;
PBDIR_H            = 0x0225;
PBREN              = 0x0226;
PBREN_L            = 0x0226;
PBREN_H            = 0x0227;
PBDS               = 0x0228;
PBDS_L             = 0x0228;
PBDS_H             = 0x0229;
PBSEL              = 0x022A;
PBSEL_L            = 0x022A;
PBSEL_H            = 0x022B;
/************************************************************
* DIGITAL I/O Port5/6 Pull up / Pull down Resistors
************************************************************/
PCIN               = 0x0240;
PCIN_L             = 0x0240;
PCIN_H             = 0x0241;
PCOUT              = 0x0242;
PCOUT_L            = 0x0242;
PCOUT_H            = 0x0243;
PCDIR              = 0x0244;
PCDIR_L            = 0x0244;
PCDIR_H            = 0x0245;
PCREN              = 0x0246;
PCREN_L            = 0x0246;
PCREN_H            = 0x0247;
PCDS               = 0x0248;
PCDS_L             = 0x0248;
PCDS_H             = 0x0249;
PCSEL              = 0x024A;
PCSEL_L            = 0x024A;
PCSEL_H            = 0x024B;
/************************************************************
* DIGITAL I/O Port7/8 Pull up / Pull down Resistors
************************************************************/
PDIN               = 0x0260;
PDIN_L             = 0x0260;
PDIN_H             = 0x0261;
PDOUT              = 0x0262;
PDOUT_L            = 0x0262;
PDOUT_H            = 0x0263;
PDDIR              = 0x0264;
PDDIR_L            = 0x0264;
PDDIR_H            = 0x0265;
PDREN              = 0x0266;
PDREN_L            = 0x0266;
PDREN_H            = 0x0267;
PDDS               = 0x0268;
PDDS_L             = 0x0268;
PDDS_H             = 0x0269;
PDSEL              = 0x026A;
PDSEL_L            = 0x026A;
PDSEL_H            = 0x026B;
/************************************************************
* DIGITAL I/O Port9/10 Pull up / Pull down Resistors
************************************************************/
PEIN               = 0x0280;
PEIN_L             = 0x0280;
PEIN_H             = 0x0281;
PEOUT              = 0x0282;
PEOUT_L            = 0x0282;
PEOUT_H            = 0x0283;
PEDIR              = 0x0284;
PEDIR_L            = 0x0284;
PEDIR_H            = 0x0285;
PEREN              = 0x0286;
PEREN_L            = 0x0286;
PEREN_H            = 0x0287;
PEDS               = 0x0288;
PEDS_L             = 0x0288;
PEDS_H             = 0x0289;
PESEL              = 0x028A;
PESEL_L            = 0x028A;
PESEL_H            = 0x028B;
/************************************************************
* DIGITAL I/O Port11 Pull up / Pull down Resistors
************************************************************/
PFIN               = 0x02A0;
PFIN_L             = 0x02A0;
PFIN_H             = 0x02A1;
PFOUT              = 0x02A2;
PFOUT_L            = 0x02A2;
PFOUT_H            = 0x02A3;
PFDIR              = 0x02A4;
PFDIR_L            = 0x02A4;
PFDIR_H            = 0x02A5;
PFREN              = 0x02A6;
PFREN_L            = 0x02A6;
PFREN_H            = 0x02A7;
PFDS               = 0x02A8;
PFDS_L             = 0x02A8;
PFDS_H             = 0x02A9;
PFSEL              = 0x02AA;
PFSEL_L            = 0x02AA;
PFSEL_H            = 0x02AB;
/************************************************************
* DIGITAL I/O PortJ Pull up / Pull down Resistors
************************************************************/
PJIN               = 0x0320;
PJIN_L             = 0x0320;
PJIN_H             = 0x0321;
PJOUT              = 0x0322;
PJOUT_L            = 0x0322;
PJOUT_H            = 0x0323;
PJDIR              = 0x0324;
PJDIR_L            = 0x0324;
PJDIR_H            = 0x0325;
PJREN              = 0x0326;
PJREN_L            = 0x0326;
PJREN_H            = 0x0327;
PJDS               = 0x0328;
PJDS_L             = 0x0328;
PJDS_H             = 0x0329;
/************************************************************
* PMM - Power Management System
************************************************************/
PMMCTL0            = 0x0120;
PMMCTL0_L          = 0x0120;
PMMCTL0_H          = 0x0121;
PMMCTL1            = 0x0122;
PMMCTL1_L          = 0x0122;
PMMCTL1_H          = 0x0123;
SVSMHCTL           = 0x0124;
SVSMHCTL_L         = 0x0124;
SVSMHCTL_H         = 0x0125;
SVSMLCTL           = 0x0126;
SVSMLCTL_L         = 0x0126;
SVSMLCTL_H         = 0x0127;
SVSMIO             = 0x0128;
SVSMIO_L           = 0x0128;
SVSMIO_H           = 0x0129;
PMMIFG             = 0x012C;
PMMIFG_L           = 0x012C;
PMMIFG_H           = 0x012D;
PMMRIE             = 0x012E;
PMMRIE_L           = 0x012E;
PMMRIE_H           = 0x012F;
PM5CTL0            = 0x0130;
PM5CTL0_L          = 0x0130;
PM5CTL0_H          = 0x0131;
/*************************************************************
* RAM Control Module
*************************************************************/
RCCTL0             = 0x0158;
RCCTL0_L           = 0x0158;
RCCTL0_H           = 0x0159;
/************************************************************
* Shared Reference
************************************************************/
REFCTL0            = 0x01B0;
REFCTL0_L          = 0x01B0;
REFCTL0_H          = 0x01B1;
/************************************************************
* Real Time Clock
************************************************************/
RTCCTL01           = 0x04A0;
RTCCTL01_L         = 0x04A0;
RTCCTL01_H         = 0x04A1;
RTCCTL23           = 0x04A2;
RTCCTL23_L         = 0x04A2;
RTCCTL23_H         = 0x04A3;
RTCPS0CTL          = 0x04A8;
RTCPS0CTL_L        = 0x04A8;
RTCPS0CTL_H        = 0x04A9;
RTCPS1CTL          = 0x04AA;
RTCPS1CTL_L        = 0x04AA;
RTCPS1CTL_H        = 0x04AB;
RTCPS              = 0x04AC;
RTCPS_L            = 0x04AC;
RTCPS_H            = 0x04AD;
RTCIV              = 0x04AE;
RTCTIM0            = 0x04B0;
RTCTIM0_L          = 0x04B0;
RTCTIM0_H          = 0x04B1;
RTCTIM1            = 0x04B2;
RTCTIM1_L          = 0x04B2;
RTCTIM1_H          = 0x04B3;
RTCDATE            = 0x04B4;
RTCDATE_L          = 0x04B4;
RTCDATE_H          = 0x04B5;
RTCYEAR            = 0x04B6;
RTCYEAR_L          = 0x04B6;
RTCYEAR_H          = 0x04B7;
RTCAMINHR          = 0x04B8;
RTCAMINHR_L        = 0x04B8;
RTCAMINHR_H        = 0x04B9;
RTCADOWDAY         = 0x04BA;
RTCADOWDAY_L       = 0x04BA;
RTCADOWDAY_H       = 0x04BB;
/************************************************************
* SFR - Special Function Register Module
************************************************************/
SFRIE1             = 0x0100;
SFRIE1_L           = 0x0100;
SFRIE1_H           = 0x0101;
SFRIFG1            = 0x0102;
SFRIFG1_L          = 0x0102;
SFRIFG1_H          = 0x0103;
SFRRPCR            = 0x0104;
SFRRPCR_L          = 0x0104;
SFRRPCR_H          = 0x0105;
/************************************************************
* SYS - System Module
************************************************************/
SYSCTL             = 0x0180;
SYSCTL_L           = 0x0180;
SYSCTL_H           = 0x0181;
SYSBSLC            = 0x0182;
SYSBSLC_L          = 0x0182;
SYSBSLC_H          = 0x0183;
SYSJMBC            = 0x0186;
SYSJMBC_L          = 0x0186;
SYSJMBC_H          = 0x0187;
SYSJMBI0           = 0x0188;
SYSJMBI0_L         = 0x0188;
SYSJMBI0_H         = 0x0189;
SYSJMBI1           = 0x018A;
SYSJMBI1_L         = 0x018A;
SYSJMBI1_H         = 0x018B;
SYSJMBO0           = 0x018C;
SYSJMBO0_L         = 0x018C;
SYSJMBO0_H         = 0x018D;
SYSJMBO1           = 0x018E;
SYSJMBO1_L         = 0x018E;
SYSJMBO1_H         = 0x018F;
SYSBERRIV          = 0x0198;
SYSBERRIV_L        = 0x0198;
SYSBERRIV_H        = 0x0199;
SYSUNIV            = 0x019A;
SYSUNIV_L          = 0x019A;
SYSUNIV_H          = 0x019B;
SYSSNIV            = 0x019C;
SYSSNIV_L          = 0x019C;
SYSSNIV_H          = 0x019D;
SYSRSTIV           = 0x019E;
SYSRSTIV_L         = 0x019E;
SYSRSTIV_H         = 0x019F;
/************************************************************
* Timer0_A5
************************************************************/
TA0CTL             = 0x0340;
TA0CCTL0           = 0x0342;
TA0CCTL1           = 0x0344;
TA0CCTL2           = 0x0346;
TA0CCTL3           = 0x0348;
TA0CCTL4           = 0x034A;
TA0R               = 0x0350;
TA0CCR0            = 0x0352;
TA0CCR1            = 0x0354;
TA0CCR2            = 0x0356;
TA0CCR3            = 0x0358;
TA0CCR4            = 0x035A;
TA0IV              = 0x036E;
TA0EX0             = 0x0360;
/************************************************************
* Timer1_A3
************************************************************/
TA1CTL             = 0x0380;
TA1CCTL0           = 0x0382;
TA1CCTL1           = 0x0384;
TA1CCTL2           = 0x0386;
TA1R               = 0x0390;
TA1CCR0            = 0x0392;
TA1CCR1            = 0x0394;
TA1CCR2            = 0x0396;
TA1IV              = 0x03AE;
TA1EX0             = 0x03A0;
/************************************************************
* Timer0_B7
************************************************************/
TB0CTL             = 0x03C0;
TB0CCTL0           = 0x03C2;
TB0CCTL1           = 0x03C4;
TB0CCTL2           = 0x03C6;
TB0CCTL3           = 0x03C8;
TB0CCTL4           = 0x03CA;
TB0CCTL5           = 0x03CC;
TB0CCTL6           = 0x03CE;
TB0R               = 0x03D0;
TB0CCR0            = 0x03D2;
TB0CCR1            = 0x03D4;
TB0CCR2            = 0x03D6;
TB0CCR3            = 0x03D8;
TB0CCR4            = 0x03DA;
TB0CCR5            = 0x03DC;
TB0CCR6            = 0x03DE;
TB0EX0             = 0x03E0;
TB0IV              = 0x03EE;
/************************************************************
* UNIFIED CLOCK SYSTEM
************************************************************/
UCSCTL0            = 0x0160;
UCSCTL0_L          = 0x0160;
UCSCTL0_H          = 0x0161;
UCSCTL1            = 0x0162;
UCSCTL1_L          = 0x0162;
UCSCTL1_H          = 0x0163;
UCSCTL2            = 0x0164;
UCSCTL2_L          = 0x0164;
UCSCTL2_H          = 0x0165;
UCSCTL3            = 0x0166;
UCSCTL3_L          = 0x0166;
UCSCTL3_H          = 0x0167;
UCSCTL4            = 0x0168;
UCSCTL4_L          = 0x0168;
UCSCTL4_H          = 0x0169;
UCSCTL5            = 0x016A;
UCSCTL5_L          = 0x016A;
UCSCTL5_H          = 0x016B;
UCSCTL6            = 0x016C;
UCSCTL6_L          = 0x016C;
UCSCTL6_H          = 0x016D;
UCSCTL7            = 0x016E;
UCSCTL7_L          = 0x016E;
UCSCTL7_H          = 0x016F;
UCSCTL8            = 0x0170;
UCSCTL8_L          = 0x0170;
UCSCTL8_H          = 0x0171;
/************************************************************
* USCI A0
************************************************************/
UCA0CTLW0          = 0x05C0;
UCA0CTLW0_L        = 0x05C0;
UCA0CTLW0_H        = 0x05C1;
UCA0BRW            = 0x05C6;
UCA0BRW_L          = 0x05C6;
UCA0BRW_H          = 0x05C7;
UCA0MCTL           = 0x05C8;
UCA0STAT           = 0x05CA;
UCA0RXBUF          = 0x05CC;
UCA0TXBUF          = 0x05CE;
UCA0ABCTL          = 0x05D0;
UCA0IRCTL          = 0x05D2;
UCA0IRCTL_L        = 0x05D2;
UCA0IRCTL_H        = 0x05D3;
UCA0ICTL           = 0x05DC;
UCA0ICTL_L         = 0x05DC;
UCA0ICTL_H         = 0x05DD;
UCA0IV             = 0x05DE;
/************************************************************
* USCI B0
************************************************************/
UCB0CTLW0          = 0x05E0;
UCB0CTLW0_L        = 0x05E0;
UCB0CTLW0_H        = 0x05E1;
UCB0BRW            = 0x05E6;
UCB0BRW_L          = 0x05E6;
UCB0BRW_H          = 0x05E7;
UCB0STAT           = 0x05EA;
UCB0RXBUF          = 0x05EC;
UCB0TXBUF          = 0x05EE;
UCB0I2COA          = 0x05F0;
UCB0I2COA_L        = 0x05F0;
UCB0I2COA_H        = 0x05F1;
UCB0I2CSA          = 0x05F2;
UCB0I2CSA_L        = 0x05F2;
UCB0I2CSA_H        = 0x05F3;
UCB0ICTL           = 0x05FC;
UCB0ICTL_L         = 0x05FC;
UCB0ICTL_H         = 0x05FD;
UCB0IV             = 0x05FE;
/************************************************************
* USCI A1
************************************************************/
UCA1CTLW0          = 0x0600;
UCA1CTLW0_L        = 0x0600;
UCA1CTLW0_H        = 0x0601;
UCA1BRW            = 0x0606;
UCA1BRW_L          = 0x0606;
UCA1BRW_H          = 0x0607;
UCA1MCTL           = 0x0608;
UCA1STAT           = 0x060A;
UCA1RXBUF          = 0x060C;
UCA1TXBUF          = 0x060E;
UCA1ABCTL          = 0x0610;
UCA1IRCTL          = 0x0612;
UCA1IRCTL_L        = 0x0612;
UCA1IRCTL_H        = 0x0613;
UCA1ICTL           = 0x061C;
UCA1ICTL_L         = 0x061C;
UCA1ICTL_H         = 0x061D;
UCA1IV             = 0x061E;
/************************************************************
* USCI B1
************************************************************/
UCB1CTLW0          = 0x0620;
UCB1CTLW0_L        = 0x0620;
UCB1CTLW0_H        = 0x0621;
UCB1BRW            = 0x0626;
UCB1BRW_L          = 0x0626;
UCB1BRW_H          = 0x0627;
UCB1STAT           = 0x062A;
UCB1RXBUF          = 0x062C;
UCB1TXBUF          = 0x062E;
UCB1I2COA          = 0x0630;
UCB1I2COA_L        = 0x0630;
UCB1I2COA_H        = 0x0631;
UCB1I2CSA          = 0x0632;
UCB1I2CSA_L        = 0x0632;
UCB1I2CSA_H        = 0x0633;
UCB1ICTL           = 0x063C;
UCB1ICTL_L         = 0x063C;
UCB1ICTL_H         = 0x063D;
UCB1IV             = 0x063E;
/************************************************************
* USCI A2
************************************************************/
UCA2CTLW0          = 0x0640;
UCA2CTLW0_L        = 0x0640;
UCA2CTLW0_H        = 0x0641;
UCA2BRW            = 0x0646;
UCA2BRW_L          = 0x0646;
UCA2BRW_H          = 0x0647;
UCA2MCTL           = 0x0648;
UCA2STAT           = 0x064A;
UCA2RXBUF          = 0x064C;
UCA2TXBUF          = 0x064E;
UCA2ABCTL          = 0x0650;
UCA2IRCTL          = 0x0652;
UCA2IRCTL_L        = 0x0652;
UCA2IRCTL_H        = 0x0653;
UCA2ICTL           = 0x065C;
UCA2ICTL_L         = 0x065C;
UCA2ICTL_H         = 0x065D;
UCA2IV             = 0x065E;
/************************************************************
* USCI B2
************************************************************/
UCB2CTLW0          = 0x0660;
UCB2CTLW0_L        = 0x0660;
UCB2CTLW0_H        = 0x0661;
UCB2BRW            = 0x0666;
UCB2BRW_L          = 0x0666;
UCB2BRW_H          = 0x0667;
UCB2STAT           = 0x066A;
UCB2RXBUF          = 0x066C;
UCB2TXBUF          = 0x066E;
UCB2I2COA          = 0x0670;
UCB2I2COA_L        = 0x0670;
UCB2I2COA_H        = 0x0671;
UCB2I2CSA          = 0x0672;
UCB2I2CSA_L        = 0x0672;
UCB2I2CSA_H        = 0x0673;
UCB2ICTL           = 0x067C;
UCB2ICTL_L         = 0x067C;
UCB2ICTL_H         = 0x067D;
UCB2IV             = 0x067E;
/************************************************************
* USCI A3
************************************************************/
UCA3CTLW0          = 0x0680;
UCA3CTLW0_L        = 0x0680;
UCA3CTLW0_H        = 0x0681;
UCA3BRW            = 0x0686;
UCA3BRW_L          = 0x0686;
UCA3BRW_H          = 0x0687;
UCA3MCTL           = 0x0688;
UCA3STAT           = 0x068A;
UCA3RXBUF          = 0x068C;
UCA3TXBUF          = 0x068E;
UCA3ABCTL          = 0x0690;
UCA3IRCTL          = 0x0692;
UCA3IRCTL_L        = 0x0692;
UCA3IRCTL_H        = 0x0693;
UCA3ICTL           = 0x069C;
UCA3ICTL_L         = 0x069C;
UCA3ICTL_H         = 0x069D;
UCA3IV             = 0x069E;
/************************************************************
* USCI B3
************************************************************/
UCB3CTLW0          = 0x06A0;
UCB3CTLW0_L        = 0x06A0;
UCB3CTLW0_H        = 0x06A1;
UCB3BRW            = 0x06A6;
UCB3BRW_L          = 0x06A6;
UCB3BRW_H          = 0x06A7;
UCB3STAT           = 0x06AA;
UCB3RXBUF          = 0x06AC;
UCB3TXBUF          = 0x06AE;
UCB3I2COA          = 0x06B0;
UCB3I2COA_L        = 0x06B0;
UCB3I2COA_H        = 0x06B1;
UCB3I2CSA          = 0x06B2;
UCB3I2CSA_L        = 0x06B2;
UCB3I2CSA_H        = 0x06B3;
UCB3ICTL           = 0x06BC;
UCB3ICTL_L         = 0x06BC;
UCB3ICTL_H         = 0x06BD;
UCB3IV             = 0x06BE;
/************************************************************
* WATCHDOG TIMER A
************************************************************/
WDTCTL             = 0x015C;
WDTCTL_L           = 0x015C;
WDTCTL_H           = 0x015D;
/************************************************************
* TLV Descriptors
************************************************************/
/************************************************************
* Interrupt Vectors (offset from 0xFF80)
************************************************************/
/************************************************************
* End of Modules
************************************************************/
