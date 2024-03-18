{ config, pkgs, lib, ... }:
{

imports = [
        ./hardware-configuration.nix
        ./pkgs.nix
        ./home.nix
    ];


##Boot

boot = {
  loader = {
    systemd-boot.enable = true;
      timeout = 0;
  };
   initrd.verbose = false;
   kernelPackages = pkgs.linuxPackages_zen;
   kernelParams = [ "fastboot" "quiet" "splash" "udev.log_level=3"];
   consoleLogLevel = 0;

};

systemd.services = {
  NetworkManager-wait-online.enable = false;
  systemd-udev-settle.enable = false;
};


##Nixos Flake/Settings

nix.settings = {
    auto-optimise-store = true;
    experimental-features = [ "nix-command" "flakes" ];
    };

nix.gc = {
        dates = "weekly";
        automatic = true;
        options = "--delete-generations +3";
    };

nixpkgs.config.allowUnfree = true;

system.stateVersion = "unstable";


##User

    users.users.joseph = {
        isNormalUser = true;
        description = "joseph";
        extraGroups = [ "networkmanager" "wheel" ];
  };

##Audio##

security.rtkit.enable = true;
    services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    wireplumber.enable = true;
    };

##Networking

networking = {
        networkmanager.enable = true; 
    };
services.openssh.enable = true;

##Time settings

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


##Hyprland

programs.hyprland.enable = true;

xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-hyprland
    ];
};


##fonts

fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
  ];


##Gaming

programs.steam.enable = true;

hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
};








}