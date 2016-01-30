/*
 * Copyright (c) 2014, Texas Instruments Incorporated
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
 *  ======== Cache.xs ========
 */

var Cache;
var Mmu;
var Startup;

/*
 * ======== getAsmFiles ========
 * return the array of assembly language files associated
 * with targetName (ie Program.build.target.$name)
 */
function getAsmFiles(targetName)
{
    switch(targetName) {
        case "ti.targets.arm.elf.A8F":
        case "ti.targets.arm.elf.A8Fnv":
            return (["Cache_asm.asm"]);
            break;

        case "gnu.targets.arm.A8F":
            return (["Cache_asm_gnu.sv7A"]);
            break;

        default:
            return (null);
    }
}

/*
 *  ======== module$meta$init ========
 */
function module$meta$init()
{
    /* Only process during "cfg" phase */
    if (xdc.om.$name != "cfg") {
        return;
    }

    this.$private.getAsmFiles = getAsmFiles;

    Cache = this;
    
    /* 
     *  This forces the delegate functions to be called directly.
     *  It removes indirect access to the delegate functions
     *  through a function table.
     */
    Cache.common$.fxntab = false;
}

/*
 *  ======== module$use ========
 */
function module$use()
{
    Mmu = xdc.useModule('ti.sysbios.family.arm.a8.Mmu');
    Startup = xdc.useModule('xdc.runtime.Startup');

    /* Enable cache early */
    Startup.firstFxns.$add(Cache.startup);
}

/*
 *  ======== module$static$init ========
 */
function module$static$init(mod, params)
{
    mod.l1dInfo = 0;
    mod.l1pInfo = 0;
    mod.l2Info = 0;
    mod.l2WaySize = 0;
    mod.lockRegister = 0;

    for (var i = 0; i < 8; i++) {
        mod.baseAddresses[i] = 0;
    }
}

/*
 *  ======== viewInitCacheInfo ========
 */
function viewInitCacheInfo(view)
{
    var Program = xdc.useModule('xdc.rov.Program');
    var Cache = xdc.useModule('ti.sysbios.family.arm.a8.Cache');

    try {
        var cacheRawView = Program.scanRawView('ti.sysbios.family.arm.a8.Cache');
    }
    catch (e) {
        return null;
    }
    try {
        var modState = Program.fetchStruct(Cache.Module_State$fetchDesc, 
                             cacheRawView.modState.$addr);
    }
    catch (e) {
        return null;
    }

    var cacheList = new Array();

    cacheList[0] = viewGetLevelView(modState.l1dInfo, "L1D");
    cacheList[1] = viewGetLevelView(modState.l1pInfo, "L1P");
    cacheList[2] = viewGetLevelView(modState.l2Info, "L2");

    view.elements = cacheList;

    return (view);
}

function viewGetLevelView(info, name)
{
    var Program = xdc.useModule('xdc.rov.Program');
    var view = 
        Program.newViewStruct('ti.sysbios.family.arm.a8.Cache', 'Cache Info');

    var numsets = ((info&0x0fffe000)>>13)+1;
    var ways = ((info&0x01ff8)>>3)+1;
    var exp = (info&0x7) + 2;
    var linesize = 4;
    while (exp--) { 
        linesize *= 2;
    }

    view.cache = name;
    view.ways = ways;
    view.waySize = numsets * linesize;
    view.lineSize = linesize;
    view.cacheSize = numsets * ways * linesize;

    return (view);
}


/*
 *  ======== viewInitWays ========
 */
function viewInitWays(view)
{
    var Program = xdc.useModule('xdc.rov.Program');
    var Cache = xdc.useModule('ti.sysbios.family.arm.a8.Cache');

    try {
        var cacheRawView = 
            Program.scanRawView('ti.sysbios.family.arm.a8.Cache');
    }
    catch (e) {
        return null;
    }
    try {
        var modState = Program.fetchStruct(Cache.Module_State$fetchDesc, 
                             cacheRawView.modState.$addr);
    }
    catch (e) {
        return null;
    }

    var wayList = new Array();

    for (var i = 0; i < 8; i++) {
        var wayInfoView = 
            Program.newViewStruct('ti.sysbios.family.arm.a8.Cache', 
                                  'L2 Way Info');
        wayInfoView.number = i;
        wayInfoView.locked = (modState.lockRegister & (1 << i)) != 0;
        wayInfoView.baseAddress = modState.baseAddresses[i];
        wayList[wayList.length] = wayInfoView;
    }

    view.elements = wayList;

    return (view);
}

