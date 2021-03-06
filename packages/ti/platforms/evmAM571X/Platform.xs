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
 *  ======== Platform.xs ========
 *  Platform support for evmAM571X
 */

var Utils = xdc.useModule('xdc.platform.Utils');

/*
 *  ======== Platform.getCpuDataSheet ========
 *  This Platform's implementation xdc.platform.IPlatform.getCpuDataSheet.
 *
 *  Return the xdc.platform.ICpuDataSheet.Instance object that corresponds
 *  to the device that runs executables loaded on the specified cpuId.
 */
function getCpuDataSheet(cpuId)
{
    if (cpuId == "0") {
        return (Utils.getCpuDataSheet(this.$module.DSP));
    }
    else if (cpuId == "1") {
        return (Utils.getCpuDataSheet(this.$module.M4));
    }
    else if (cpuId == "2") {
        return (Utils.getCpuDataSheet(this.$module.GPP));
    }
    else {
        this.$module.$logError("The platform " + this.$module.$name +
            " does not contain cpu with cpuId: " + cpuId, this.$module, null);
    }
}

/*
 *  ======== Platform.getExeContext ========
 *  This Platform's implementation xdc.platform.IPlatform.getExeContext.
 *
 *  Return the xdc.platform.IPlatform.ExeContext object that will run the
 *  specified program prog.
 */
function getExeContext(prog)
{
    var ExeContext = xdc.useModule('xdc.platform.ExeContext');

    /* create a default ExeContext execution context */
    var cpu;
    var core = this.$private.core;

    xdc.loadPackage(this.$module[core].catalogName);
    cpu = ExeContext.create(this.$module[core], this.$module.BOARD);
    cpu.memoryMap = Utils.assembleMemoryMap(cpu, this);

    /* The catalog file used by this platform package contains memory objects
     * OCMC_RAM2 and OCMC_RAM3, but the actual device AM571X does not have
     * them.
     */
    for (var name in cpu.memoryMap) {
        if (name == "OCMC_RAM2" || name == "OCMC_RAM3") {
            delete cpu.memoryMap[name];
        }
    }

    if (this.codeMemory == undefined) {
        this.codeMemory = "EXT_RAM";
    }

    if (this.dataMemory == undefined) {
        this.dataMemory = "EXT_RAM";
    }

    if (this.stackMemory == undefined) {
        this.stackMemory = "EXT_RAM";
    }

    // check for the overlap in the memory map
    var overlap = Utils.checkOverlap(cpu.memoryMap);

    if (overlap != null) {
        this.$module.$logError("Memory objects " + overlap + " overlap", this,
            overlap);
    }

    this.$seal();

    return (cpu);
}

/*
 *  ======== Platform.getExecCmd ========
 *  This Platform's implementation xdc.platform.IPlatform.getExecCmd.
 */
function getExecCmd(prog)
{
    var os = environment["xdc.hostOS"];
    var updateComment = "@$(ECHO) Check for updates to this package at:\n" +
    "@$(ECHO) http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/rtsc/index.html";

     return("@$(ECHO) " + this.$package.$name + " platform package cannot " +
         "execute " + prog.name + " on " + os + "\n" + updateComment +
         "\n\t:");
}

/*
 *  ======== Platform.getLinkTemplate ========
 *  This is Platform's implementation xdc.platform.IPlatform.getLinkTemplate
 */
function getLinkTemplate(prog)
{
    /* use the target's linker command template */
    /* we compute the target because this same platform is supported by
     * many different tool chains; e.g., ti.targets, gnu.targets, ...
     */
    var tname = prog.build.target.$name;
    var tpkg = tname.substring(0, tname.lastIndexOf('.'));
    var tmplName = "/linkcmd.xdt";

    /* Use bare metal linker command file if appropriate */
    if (Program.build.target.$name.match(/gnu.targets.arm.A/)) {
        tmplName = "/linkcmd_bm_v7a.xdt";
    }
    var templateName = tpkg.replace(/\./g, "/") + tmplName;

    if (xdc.findFile(templateName) != null) {
        return (templateName);
    }
    else if (tname.indexOf("ti.targets.") == 0) {
        tmplName = "/linkcmd.xdt";
        return ("ti/targets/linkcmd.xdt");
    }
    else {
        throw new Packages.xdc.services.global.XDCException(
            this.$package.$name + ".LINK_TEMPLATE_ERROR",
            "Target package " + tpkg + " does not contain linker command "
            + "template '" + tmplName.substring(1) + "'.");
    }
}

/*
 *  ======== Platform.Instance.init ========
 *  This function is called to initialize a newly created instance of a
 *  platform.  Platform instances are created just prior to running
 *  program configuration scripts.
 *
 *  Platform instances may also be created in the build domain.
 *
 *  @param(name)        the name used to identify this instance (without
 *                      the package name prefix).
 */
function instance$meta$init(name)
{
    /* if not in config phase, do nothing */
    if (xdc.om.$name != "cfg") {
        return;
    }

    var thisMod = this.$module;

    /*  If given name matches a "named platform instance" from the xdc
     *  file, then use the create args specified for that named instance.
     */
    var args = {};

    if (name in thisMod) {
        args = thisMod[name];
    }

    var armChain = ["v7M", "v7M4"];
    var dspChain = ["62", "64", "64P", "674", "66"];
    var gppChain = ["v7A15"];
    for (var i = 0; i < dspChain.length; i++) {
        if (dspChain[i] == Program.build.target.isa) {
            args.core = "DSP";
        }
    }
    for (var i = 0; i < armChain.length; i++) {
        if (armChain[i] == Program.build.target.isa) {
            args.core = "M4";
        }
    }
    for (var i = 0; i < gppChain.length; i++) {
        if (gppChain[i] == Program.build.target.isa) {
            args.core = "GPP";
        }
    }

    if (args.core == null) {
        this.$module.$logError("The build target " + Program.build.target.$name
            + " is incompatible with this platform.", this.$module, null);
    }

    if ("externalMemoryMap" in args) {

        /* The external map has to be of the right type for this check to
         * work.
         */
        var external = new xdc.om['xdc.platform.IPlatform'].MemoryMap(
            args.externalMemoryMap);
        if (!Utils.checkFit(this.$module.PARAMS.externalMemoryMap, external)) {
            this.$module.$logError("External memory map cannot fit in " +
                "the available space.", this, null);
        }
        this.externalMemoryMap = external;
    }

    if ("codeMemory" in args) {
        this.codeMemory = args.codeMemory;
    }

    if ("dataMemory" in args) {
        this.dataMemory = args.dataMemory;
    }

    if ("stackMemory" in args) {
        this.stackMemory = args.stackMemory;
    }

    /* Save 'core' to avoid computing it again */
    this.$private.core = args.core;
}
/*
 *  @(#) ti.platforms.evmAM571X; 1, 0, 0, 0,; 8-14-2015 13:39:56; /db/ztree/library/trees/platform/platform-q07/src/
 */

