{ config, lib, pkgs, ... }:
{

    users.users.joseph = {
        isNormalUser = true;
        description = "joseph";
        extraGroups = [ "networkmanager" "wheel" ];
  };

  programs.git.config = {
    user.name = "Joseph Springer";
    user.email = "josephtspringer@gmail.com";
  };








}
