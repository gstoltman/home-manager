{ pkgs, config, ... }:

{
  home.packages = with pkgs; [ eww ];

  home.file.eww = {
    recursive = false;
    source = ./dotfiles/eww/eww.yuck;
    target = "./.config/eww/eww.yuck";
  };
}
