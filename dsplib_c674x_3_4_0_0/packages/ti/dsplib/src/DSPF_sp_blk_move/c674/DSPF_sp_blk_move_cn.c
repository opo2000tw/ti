/* ======================================================================= */
/* DSPF_sp_blk_move_cn.c -- Move a block of memory                         */
/*                      Natural C Implementation                           */
/*                                                                         */
/* Rev 0.0.1                                                               */
/*                                                                         */
/*  USAGE                                                                  */
/*      This routine has the following C prototype:                        */
/*                                                                         */
/*          void DSPF_sp_blk_move_cn                                       */
/*          (                                                              */
/*              short *restrict x,   // Block of data to move              */
/*              short *restrict r,   // Destination of block of data       */
/*              int   nx             // Number of elements in block        */
/*          );                                                             */
/*                                                                         */
/*  DESCRIPTION                                                            */
/*      Move nx 16-bit elements from one memory location                   */
/*      to another.                                                        */
/*                                                                         */
/*      void blk_move(short *x,short *r, int nx)                           */
/*      {                                                                  */
/*          int i;                                                         */
/*          for (i = 0 ; i < nx; i++){                                     */
/*              r[i]=x[i];                                                 */
/*          }                                                              */
/*      }                                                                  */
/*                                                                         */
/*  ASSUMPTIONS                                                            */
/*      None                                                               */
/*                                                                         */
/*                                                                         */
/* Copyright (C) 2011 Texas Instruments Incorporated - http://www.ti.com/  */ 
/*                                                                         */
/*                                                                         */
/*  Redistribution and use in source and binary forms, with or without     */
/*  modification, are permitted provided that the following conditions     */
/*  are met:                                                               */
/*                                                                         */
/*    Redistributions of source code must retain the above copyright       */
/*    notice, this list of conditions and the following disclaimer.        */
/*                                                                         */
/*    Redistributions in binary form must reproduce the above copyright    */
/*    notice, this list of conditions and the following disclaimer in the  */
/*    documentation and/or other materials provided with the               */
/*    distribution.                                                        */
/*                                                                         */
/*    Neither the name of Texas Instruments Incorporated nor the names of  */
/*    its contributors may be used to endorse or promote products derived  */
/*    from this software without specific prior written permission.        */
/*                                                                         */
/*  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS    */
/*  "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT      */
/*  LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR  */
/*  A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT   */
/*  OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,  */
/*  SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT       */
/*  LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,  */
/*  DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY  */
/*  THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT    */
/*  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE  */
/*  OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.   */
/*                                                                         */
/* ======================================================================= */

#include "DSPF_sp_blk_move_cn.h"

void DSPF_sp_blk_move_cn(const float *x, float *y, const int n)
{
    int i;

    for (i = 0 ; i < n; i++)
        y[i] = x[i];
}

/* ======================================================================= */
/*  End of file:  DSPF_sp_blk_move_cn.c                                    */
/* ----------------------------------------------------------------------- */
/*            Copyright (c) 2011 Texas Instruments, Incorporated.          */
/*                           All Rights Reserved.                          */
/* ======================================================================= */

