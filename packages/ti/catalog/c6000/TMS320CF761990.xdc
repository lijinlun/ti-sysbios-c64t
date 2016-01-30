/*
 *  Copyright (c) 2015 by Texas Instruments and others.
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
 *  ======== TMS320CF761990.xdc ========
 *
 */
package ti.catalog.c6000;

/*!
 *  ======== TMS320CF761990 ========
 *  The C64P device data sheet module.
 *
 *  This module implements the xdc.platform.ICpuDataSheet interface and is 
 *  used by platforms to obtain "data sheet" information about this device.
 */
metaonly module TMS320CF761990 inherits ti.catalog.ICpuDataSheet
{

    config long cacheSizeL1[string] = [
        ["0k",  0x0000],
        ["4k",  0x1000],
        ["8k",  0x2000],
        ["16k", 0x4000],
        ["32k", 0x8000],
    ];

    config long cacheSizeL2[string] = [
        ["0k",  0x00000],
        ["32k", 0x08000],
        ["64k", 0x10000]
    ];

    readonly config ti.catalog.c6000.ICacheInfo.CacheDesc cacheMap[string] =  [
         ['l1PMode',{desc:"L1P Cache",
                     base: 0x11E08000,
                     map : [["0k",0x0000],
                            ["4k",0x1000],
                            ["8k",0x2000],
                            ["16k",0x4000],
                            ["32k",0x8000]],
                     defaultValue: "32k",
                     memorySection: "L1PSRAM"}],
     
                 ['l1DMode',{desc:"L1D Cache",
                     base: 0x11F04000,
                     map : [["0k",0x0000],
                            ["4k",0x1000],
                            ["8k",0x2000],
                            ["16k",0x4000],
                            ["32k",0x8000]],
                     defaultValue: "32k",
                     memorySection: "L1DSRAM"}],
                 
         ['l2Mode',{desc:"L2 Cache",
                     base: 0x11800000,
                     map : [["0k",0x0000],
                            ["32k",0x8000],
                            ["64k",0x10000]],
                     defaultValue: "0k",
                     memorySection: "IRAM"}], 

    ];

instance:
    override config int     minProgUnitSize = 1;
    override config int     minDataUnitSize = 1;    
    override config int     dataWordSize    = 4;

    override config string   cpuCore        = "F761990";
    override config string   isa = "64P";
    override config string   cpuCoreRevision = "1.0";

    config xdc.platform.IPlatform.Memory memMap[string]  = [
        ["IRAM", {
            comment:    "Internal 64KB L2 UMAP0 memory",
            name:       "IRAM",
            base:       0x11800000,
            len:        0x00010000,
            space:      "code/data",
            access:     "RWX"
        }],
        
        ["L1PSRAM", {
            comment:    "Internal 32KB L1 program memory",
            name:       "L1PSRAM",
            base:       0x11E08000,
            len:        0x00008000,
            space:      "code",
            access:     "RWX"
        }],

        ["L1DSRAM", {
            comment:    "Internal 80KB L1 data memory",
            name:       "L1DSRAM",
            base:       0x11F04000,
            len:        0x00014000,
            space:      "data",
            access:     "RW"
        }],

        ["ARM_RAM0", {
            comment:    "Internal ARM RAM instruction memory",
            name:       "ARM_RAM0",
            base:       0x02000000,
            len:        0x00008000,
            space:      "code",
            access:     "RWX"
        }],

        ["ARM_RAM1", {
            comment:    "Internal ARM RAM data memory",
            name:       "ARM_RAM1",
            base:       0x02008000,
            len:        0x00004000,
            space:      "data",
            access:     "RW"
        }],
    ];
};
/*
 *  @(#) ti.catalog.c6000; 1, 0, 0, 0,; 8-14-2015 13:38:33; /db/ztree/library/trees/platform/platform-q07/src/
 */

