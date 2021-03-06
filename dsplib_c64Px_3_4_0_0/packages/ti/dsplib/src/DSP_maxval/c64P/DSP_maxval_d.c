/* ======================================================================= */
/* DSP_maxval_d.c -- Maximum value driver code implementation              */
/*                                                                         */
/* Rev 0.0.1                                                               */
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

#include <stdio.h>
#include <time.h>
#include <stdlib.h>
#include <limits.h>
#include <c6x.h>

/* Interface header files for the natural C and optimized C code */
#include "DSP_maxval_cn.h"
#include "DSP_maxval.h"

/* Defines */
#if defined(__TI_EABI__)
#define kernel_size _kernel_size
#endif

extern char kernel_size;

#define FORMULA_SIZE          2
#define FORMULA_DEVIDE        8
#define CYCLE_FORMULA_NX_PT1  32
#define CYCLE_FORMULA_NX_PT2  64
/* inverse of [32 1] */
/*            [64 1] */
float form_inv[FORMULA_SIZE][FORMULA_SIZE] = 
{{-0.0313,  0.0313},
 { 2.0000, -1.0000}
};
float form_temp  [FORMULA_SIZE];
int   form_cycle [FORMULA_SIZE];
int   form_result[FORMULA_SIZE];

#define MAXARRAYSIZE 128

#pragma DATA_ALIGN(x, 8);

short x[MAXARRAYSIZE];

void main(void)
{
    clock_t t_overhead, time, time_n;
    int i, j, maxValC, maxValLib, arraySize;
    int errorMax = 0;
    int form_error = 0;

    /* Initialize timer for clock */
    TSCL= 0,TSCH=0;
    /*  Compute the overhead of calling _itoll(TSCH, TSCL) twice to get timing info. */
    t_overhead = _itoll(TSCH, TSCL);
    t_overhead = _itoll(TSCH, TSCL) - t_overhead;

    /*  TEST 1: Fill the array with the smallest short value  */
    for(j = 0; j < MAXARRAYSIZE; j++)
        x[j] = SHRT_MIN;

    maxValC   = DSP_maxval_cn(x, MAXARRAYSIZE);
    maxValLib = DSP_maxval(x, MAXARRAYSIZE);
    if(maxValC != maxValLib)
        errorMax++;

    /*  TEST 2:  Fill the array with the biggest short value  */
    for(j = 0; j < MAXARRAYSIZE; j++)
        x[j] = SHRT_MAX;

    maxValC   = DSP_maxval_cn(x, MAXARRAYSIZE);
    maxValLib = DSP_maxval(x, MAXARRAYSIZE);
    if(maxValC != maxValLib)
        errorMax++;

    /*  TEST 3: Fill the array with zeros  */
    for(j=0; j<MAXARRAYSIZE; j++)
        x[j]=0;

    maxValC   = DSP_maxval_cn(x, MAXARRAYSIZE);
    maxValLib = DSP_maxval(x, MAXARRAYSIZE);
    if(maxValC != maxValLib)
        errorMax++;

    if (errorMax)
        printf("DSP_maxval: Result Failure\n");

    /*  TEST 4: Test arrays with sizes from 8 to 128 elements  */
    for(arraySize = 8, i = 1; arraySize <= MAXARRAYSIZE; arraySize *= 2, i++) {

        /* -------------------------------------------------------------------- */
        /*  Print timing results.                                               */
        /* -------------------------------------------------------------------- */
        printf("DSP_maxval\tIter#: %d\t", i);

        for(j = 0; j < arraySize; j++)
            x[j] = rand();

        time_n = _itoll(TSCH, TSCL);
        maxValC = DSP_maxval_cn(x, arraySize);
        time_n = _itoll(TSCH, TSCL) - time_n - t_overhead;

        time = _itoll(TSCH, TSCL);
        maxValLib = DSP_maxval(x, arraySize);
        time = _itoll(TSCH, TSCL) - time - t_overhead;

        if(maxValC != maxValLib)
            printf("Result Failure");
        else
            printf("Result Successful");

        printf("\tNX = %d\tnatC: %d\tintC: %d\n", arraySize, time_n, time);

        if (arraySize == CYCLE_FORMULA_NX_PT1)
          form_cycle[0] = time;
        if (arraySize == CYCLE_FORMULA_NX_PT2)
          form_cycle[1] = time;
    }

    /* Provide memory information */
#ifdef __TI_COMPILER_VERSION__            // for TI compiler only
    printf("Memory:  %d bytes\n", &kernel_size);
#endif

    /* Provide profiling information */
    for (i = 0; i < FORMULA_SIZE; i++) {
        form_temp[i] = 0;
        for (j = 0; j < FORMULA_SIZE; j++) {
            form_temp[i] += form_inv[i][j] * form_cycle[j];
        }
        if (i != (FORMULA_SIZE-1)) {
            form_result[i] = (int) (form_temp[i] * FORMULA_DEVIDE + 0.5);
            if ((form_result[i] - form_temp[i] * FORMULA_DEVIDE) >  0.1 ||
                (form_result[i] - form_temp[i] * FORMULA_DEVIDE) < -0.1) {
                form_error = 1;
            }
        }
        else {
            form_result[i] = (int) (form_temp[i] + 0.5);
        }
    }

    if (!form_error)
        if (FORMULA_DEVIDE == 1) {
            printf("Cycles:  %d*Nx + %d \n", form_result[0], form_result[1]);
        }
        else {
            printf("Cycles:  %d/%d*Nx + %d \n", form_result[0], FORMULA_DEVIDE, form_result[1]);
        }
    else
        printf("Cycles Formula Not Available\n");

}

/* ======================================================================== */
/*  End of file:  DSP_maxval_d.c                                            */
/* ------------------------------------------------------------------------ */
/*            Copyright (c) 2011 Texas Instruments, Incorporated.           */
/*                           All Rights Reserved.                           */
/* ======================================================================== */

