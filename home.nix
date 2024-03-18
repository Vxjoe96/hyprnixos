{ config, pkgs, ... }:

let
  colloid_name = "Colloid-Grey-Black-Rimless";
  colloid = pkgs.colloid-gtk-theme.override {
    themeVariants = [ "Grey" ];
    tweaks = [ "rimless" "black" ];
    colorVariants = "dark";
  };
in
{
  
gtk = {
    enable = true;
    theme = {
      name = colloid_name;
      package = colloid;
    };  
};

 qt = {
    enable = true;
    platformTheme = "gtk";
  };
  
  home.packages = with pkgs; [
    xfce.thunar
  ];
  
  # TODO please change the username & home directory to your own
  home.username = "joseph";
  home.homeDirectory = "/home/joseph";

  # link the configuration file in current directory to the specified location in home directory
  # home.file.".config/i3/wallpaper.jpg".source = ./wallpaper.jpg;

  # link all files in `./scripts` to `~/.config/i3/scripts`
  # home.file.".config/i3/scripts" = {
  #   source = ./scripts;
  #   recursive = true;   # link recursively
  #   executable = true;  # make all files executable
  # };
  

  # This value determines the home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update home Manager without changing this value. See
  # the home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "24.05";

  # Let home Manager install and manage itself.
  programs.home-manager.enable = true;
}