{ pkgs, config, ... }:

{
  programs.git = {
    enable = true;
  };

  home.file.".gitconfig" = {
    source = ./dotfiles/git/gitconfig;
    target = "./.gitconfig";
  };
}
