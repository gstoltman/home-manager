{ pkgs, config, ... }:

{
  programs = {
    vscode = {
      enable = true;
      package = pkgs.vscodium;
      profiles.default.userSettings = {
        editor.fontSize = 20;
      };
    };
  };
}
