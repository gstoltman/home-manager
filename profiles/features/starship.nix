{ pkgs, config, ... }:

{
  home.file.starship = {
    recursive = false;
    source = ./dotfiles/starship/starship.toml;
    target = "./.config/starship.toml";
  };
}
