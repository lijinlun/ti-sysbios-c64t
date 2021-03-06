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
 *  ======== PinMux ========
  */
metaonly module PinMux inherits IPinMux
{
instance:
    /*!
     *  ======== baseAddr ========
     *  Address of the peripheral's control register.
     *
     *  A peripheral's registers are commonly accessed through a structure
     *  that defines the offsets of a particular register from the lowest
     *  address mapped to a peripheral. That lowest address is specified by
     *  this parameter.
     */
    config UInt baseAddr;
}
/*
 *  @(#) ti.catalog.msp430.peripherals.pinmux; 1, 0, 0,; 8-14-2015 13:38:44; /db/ztree/library/trees/platform/platform-q07/src/
 */

