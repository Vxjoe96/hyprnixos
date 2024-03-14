{ pkgs, lib, ... }:

{
environment.systemPackages = with pkgs; [

kitty
firefox
xfce.thunar
vscode
wofi
];

}
