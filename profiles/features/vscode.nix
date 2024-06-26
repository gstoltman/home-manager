{ pkgs, config, ... }:

{
  programs = {
    vscode = {
      enable = true;
      package = pkgs.vscodium;
      userSettings = {
        editor.fontSize = 20;
      };
    };
  };
}
