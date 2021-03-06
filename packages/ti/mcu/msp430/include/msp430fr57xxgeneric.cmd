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
/* msp430fr57xxgeneric.cmd                                                    */
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
 || defined(__MSP430_HAS_T0A3__) || defined(__MSP430_HAS_T1A3__) || defined(__MSP430_HAS_T2A3__) || defined(__MSP430_HAS_T3A3__) \
 || defined(__MSP430_HAS_T0A5__) || defined(__MSP430_HAS_T1A5__) || defined(__MSP430_HAS_T2A5__) || defined(__MSP430_HAS_T3A5__) \
 || defined(__MSP430_HAS_T0A7__) || defined(__MSP430_HAS_T1A7__) || defined(__MSP430_HAS_T2A7__) || defined(__MSP430_HAS_T3A7__)
  #define __MSP430_HAS_TxA7__
 || defined(__MSP430_HAS_T1B3__) || defined(__MSP430_HAS_T1B5__) || defined(__MSP430_HAS_T1B7__)
  #define __MSP430_HAS_TxB7__
 || defined(__MSP430_HAS_T1D3__) || defined(__MSP430_HAS_T1D5__) || defined(__MSP430_HAS_T1D7__)
  #define __MSP430_HAS_TxD7__
  #define __MSP430_HAS_USCI_Ax__
  #define __MSP430_HAS_USCI_Bx__
  #define __MSP430_HAS_EUSCI_Ax__
  #define __MSP430_HAS_EUSCI_Bx__
  #define __MSP430_HAS_EUSCI_Bx__
/************************************************************
* ADC10_B
************************************************************/
/************************************************************
* Comparator D
************************************************************/
/*************************************************************
* CRC Module
*************************************************************/
/************************************************************
* CLOCK SYSTEM
************************************************************/
/************************************************************
* DMA_X
************************************************************/
/*************************************************************
* FRAM Memory
*************************************************************/
/************************************************************
* Memory Protection Unit
************************************************************/
/************************************************************
* HARDWARE MULTIPLIER 32Bit
************************************************************/
/************************************************************
* PMM - Power Management System
************************************************************/
/************************************************************
* DIGITAL I/O Port1/2 Pull up / Pull down Resistors
************************************************************/
/************************************************************
* DIGITAL I/O Port3/4 Pull up / Pull down Resistors
************************************************************/
/************************************************************
* DIGITAL I/O Port5/6 Pull up / Pull down Resistors
************************************************************/
/************************************************************
* DIGITAL I/O Port7/8 Pull up / Pull down Resistors
************************************************************/
/************************************************************
* DIGITAL I/O Port9/10 Pull up / Pull down Resistors
************************************************************/
/************************************************************
* DIGITAL I/O Port11 Pull up / Pull down Resistors
************************************************************/
/************************************************************
* DIGITAL I/O PortJ Pull up / Pull down Resistors
************************************************************/
/************************************************************
* PMM - Power Management System
************************************************************/
/************************************************************
* Shared Reference
************************************************************/
/************************************************************
* Real Time Clock
************************************************************/
/************************************************************
* SFR - Special Function Register Module
************************************************************/
/************************************************************
* SYS - System Module
************************************************************/
/************************************************************
* Timerx_A7
************************************************************/
/************************************************************
* Timerx_B7
************************************************************/
/************************************************************
* USCI Ax
************************************************************/
/************************************************************
* USCI Bx
************************************************************/
/************************************************************
* WATCHDOG TIMER A
************************************************************/
/************************************************************
* TLV Descriptors
************************************************************/
/************************************************************
* Interrupt Vectors (offset from 0xFF80)
************************************************************/
/************************************************************
* End of Modules
************************************************************/
