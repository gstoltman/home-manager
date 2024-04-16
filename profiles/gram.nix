{ config, pkgs, inputs , ... }:

{
  home.username = "grant";
  home.homeDirectory = "/home/grant";

  nixpkgs.config.allowUnfreePredicate = _: true;

  imports = [
    inputs.nix-colors.homeManagerModules.default
      ./features/alacritty.nix
      ./features/bash.nix
      ./features/git.nix
#      ./features/i3.nix
      ./features/nvim/nvim.nix
#      ./features/polybar.nix
      ./features/starship.nix
      ./features/vscode.nix
  ];

  colorScheme = inputs.nix-colors.colorSchemes.everforest;

  home.packages = with pkgs; [
	  bat
	  btop
	  discord
	  firefox
	  fzf
	  neofetch
	  obsidian
	  ripgrep
    #tmux
	  unzip
    xclip

	  # Fonts
    ( nerdfonts.override { fonts = [ "Iosevka" ]; } )
  ];

  home.file = {
    #tmux = {
    #  source = ../dotfiles/tmux/tmux.conf;
    #  target = "./.tmux.conf";
    #};
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

# Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
