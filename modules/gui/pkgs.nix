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
    
}





}
