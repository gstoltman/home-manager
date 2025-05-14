{config, lib, pkgs, nixvim, ...}:

{
  imports = [
    ./options.nix
  ];

  programs.nixvim = {
    enable = true;
  };
}
