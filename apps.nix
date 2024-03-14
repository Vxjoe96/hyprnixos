{ input, pkgs, ... }:

{
enviroment.systemPackages = with pkgs; [

kitty
firefox
xfce.thunar
vscode
wofi
];

}
