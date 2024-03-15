{ config, lib, pkgs, ...}:
{

    nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
    powerManagement.cpuFreqGovernor = lib.mkDefault "performance";
    hardware.cpu.intel.updateMicrocode = true;
    


}