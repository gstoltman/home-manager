{ config, pkgs, inputs , ... }:

{
  home.username = "grant";
  home.homeDirectory = "/home/grant";

  nixpkgs.config.allowUnfreePredicate = _: true;

  imports = [
      ./features/bash.nix
      ./features/firefox.nix
      ./features/git.nix
      ./features/ghostty.nix
      ./features/nixvim
      ./features/starship.nix
      ./features/stylix.nix
      ./features/sway.nix
      ./features/vscode.nix
      ./features/waybar.nix
      ./features/wofi.nix
  ];

  home.packages = with pkgs; [
    bat
	btop
    fastfetch
    flameshot
    krita
	obsidian
    pavucontrol
    vlc
  ];

  programs = {
    home-manager.enable = true;
  };

  home.sessionVariables = {
    EDITOR = "nvim";
    XDG_CACHE_HOME = "$HOME/.cache";
    XDG_CONFIG_HOME = "$HOME/.config";
    XDG_DATA_HOME = "$HOME/.local/share";
    XDG_STATE_HOME = "$HOME/.local/state";
    XDG_BIN_HOME = "$HOME/.local/bin";
    XDG_DESKTOP_DIR="$HOME/desktop";
    XDG_DOWNLOAD_DIR="$HOME/downloads";
  };

  home.sessionPath = [
    "$XDG_BIN_HOME"
  ];

  # Restart services on switch
  systemd.user.startServices = "sd-switch";

  home.stateVersion = "24.05"; # No need to change.
}
