{ pkgs, config, ... }:

{
  programs.vscode.enable = true;
  programs.vscode.package = pkgs.vscodium;
}
