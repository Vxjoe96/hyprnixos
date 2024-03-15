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
(colloid-gtk-theme.override {
   themeVariants = "grey";
   colorVariants = "dark";
   sizeVariants = "compact";
   tweaks = [ "rimless" "black" "float" ];
})

];

programs = {

    hyprland.enable = true;
    
};

  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
  ];




}
