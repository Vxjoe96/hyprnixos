{ config, pkgs, lib, ... }:

{
environment.systemPackages = with pkgs; [

hyprpaper
hypridle
hyprlock
kitty
wofi
dunst
libnotify
pulsemixer

];

programs = {

    hyprland.enable = true;
    
};

  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
  ];




}
