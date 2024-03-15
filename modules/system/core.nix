{ config, lib, pkgs, ... }:

{
    imports = [
        ./boot.nix
        ./pkgs.nix
        ./user.nix
    ];

    nix.gc = {
        dates = "weekly";
        automatic = true;
        options = "--delete-generations +3";
    };

    services.xserver = {
    layout = "us";
    xkbVariant = "";
    };

    nix.settings = {
    auto-optimise-store = true;
    experimental-features = [ "nix-command" "flakes" ];
    };

    nixpkgs.config.allowUnfree = true;

    time.timeZone = "America/Denver";
    i18n.defaultLocale = "en_US.UTF-8";
    i18n.extraLocaleSettings = {
        LC_ADDRESS = "en_US.UTF-8";
        LC_IDENTIFICATION = "en_US.UTF-8";
        LC_MEASUREMENT = "en_US.UTF-8";
        LC_MONETARY = "en_US.UTF-8";
        LC_NAME = "en_US.UTF-8";
        LC_NUMERIC = "en_US.UTF-8";
        LC_PAPER = "en_US.UTF-8";
        LC_TELEPHONE = "en_US.UTF-8";
        LC_TIME = "en_US.UTF-8";
  };

    networking = {
        networkmanager.enable = true; 
    };




    system.stateVersion = "unstable";
}