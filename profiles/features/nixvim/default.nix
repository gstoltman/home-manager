{config, lib, pkgs, nixvim, ...}:

{
  imports = [
    ./bufferline.nix
    ./options.nix
    ./telescope.nix
    ./treesitter.nix
  ];

  programs.nixvim = {
    enable = true;
  };
}
