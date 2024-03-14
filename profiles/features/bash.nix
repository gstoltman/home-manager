{ pkgs, config, ... }:

{
  home.file.bash = {
    recursive = false;
    source = ./dotfiles/bash/bashrc;
    target = "./.bashrc";
  };
}
