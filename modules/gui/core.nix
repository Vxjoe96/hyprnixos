{ config, lib, pkgs, ... }:

{
    imports = [
        ./pkgs.nix
    ];

    security.rtkit.enable = true;
    services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    wireplumber.enable = true;
    };

    hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;

    };

    xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-hyprland
    ];
  };

}

