{ pkgs, config, ... }:
{
  home.packages = with pkgs; [ starship ];

  home.file.starship = {
    recursive = false;
    source = ./dotfiles/starship/starship.toml;
    target = "./.config/starship.toml";
  };
}
