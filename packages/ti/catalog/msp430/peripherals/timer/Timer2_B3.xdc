/* 
 *  Copyright (c) 2008 Texas Instruments and others.
 *  All rights reserved. This program and the accompanying materials
 *  are made available under the terms of the Eclipse Public License v1.0
 *  which accompanies this distribution, and is available at
 *  http://www.eclipse.org/legal/epl-v10.html
 *
 *  Contributors:
 *      Texas Instruments - initial implementation
 *
 * */
/*!
 *  ======== Timer2_B3 ========
 *  MSP430 Timer2_B3 timer
 */
metaonly module Timer2_B3 inherits ITimer_B {


instance:

    /*! Timer interrupt enables */
    config regIntVect_t interruptSource[8];

}
/*
 *  @(#) ti.catalog.msp430.peripherals.timer; 1, 0, 0,; 8-14-2015 13:38:49; /db/ztree/library/trees/platform/platform-q07/src/
 */

