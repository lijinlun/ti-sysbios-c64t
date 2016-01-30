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

/*
 *  ======== GPIO_MSP430G2x52.xs ========
 */

/*
 *  ======== instance$meta$init ========
 */
function instance$meta$init(usi, comparator, adc10)
{
    /* Call super's initializer */
    this.$module.$super.instance$meta$init.$apply(this, []);

    /* Initialize this config */
    this.usi = usi;
    this.comparator = comparator;
    this.adc10 = adc10;
    var caps = xdc.loadCapsule
        ("ti/catalog/msp430/peripherals/gpio/GPIO_MSP430G2x52_pins.xs");
    caps.setPins(this);
}
/*
 *  @(#) ti.catalog.msp430.peripherals.gpio; 1, 0, 0,; 8-14-2015 13:38:45; /db/ztree/library/trees/platform/platform-q07/src/
 */

