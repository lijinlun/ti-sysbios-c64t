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
 *  ======== A8Fv.xdc ========
 *  Cortex A8 little endian with vector floating point support 
 *  (VFPV3) (ELF)
 */
metaonly module A8Fv inherits ti.targets.arm.elf.IA8 {
    override readonly config string name        = "A8Fv";
    override readonly config string suffix      = "ea8fv";
    override readonly config string rts         = "ti.targets.arm.rtsarm";

    override readonly config xdc.bld.ITarget.Model model = {
        endian: "little",
        shortEnums: true
    };

    override readonly config xdc.bld.ITarget2.Command cc = {
        cmd:  "armcl -c",
        opts: "--endian=little -mv7A8 --abi=eabi --float_support=vfpv3"
    };

    override readonly config xdc.bld.ITarget2.Command asm = {
        cmd:  "armcl -c",
        opts: "--endian=little -mv7A8 --abi=eabi --float_support=vfpv3"
    };
}
/*
 *  @(#) ti.targets.arm.elf; 1, 0, 0,0; 7-10-2015 12:06:12; /db/ztree/library/trees/xdctargets/xdctargets-j04/src/ xlibrary

 */

