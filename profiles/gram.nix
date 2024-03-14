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
      ./features/starship.nix
      ./features/vscode.nix
    ];

    colorScheme = inputs.nix-colors.colorSchemes.everforest;
    
    home.packages = with pkgs; [
	bat
	btop
	discord
	firefox
	#fzf
	#jq
	neofetch
	neovim
	obsidian
	#ripgrep
	#tmux
	unzip
        xclip

	### Fonts
        ( nerdfonts.override { fonts = [ "Iosevka" ]; } )

        ### Language Support
        #typst
        #go
    ];

    home.file = {
        #neovim = {
        #    recursive = true;
        #    source = ../dotfiles/nvim;
        #    target = "./.config/nvim";
        #};
        #tmux = {
        #    source = ../dotfiles/tmux/tmux.conf;
        #    target = "./.tmux.conf";
        #};
    };

    home.sessionVariables = {
        EDITOR = "nvim";
        XDG_CACHE_HOME = "$HOME/.cache";
        XDG_CONFIG_HOME = "$HOME/.config";
        XDG_DATA_HOME = "$HOME/.local/share";
        XDG_STATE_HOME = "$HOME/.local/state";
        XDG_BIN_HOME = "$HOME/.local/bin"; 	# Not technically in the official xdg specification
        XDG_DESKTOP_DIR="$HOME/desktop";
        XDG_DOWNLOAD_DIR="$HOME/downloads";
    };

    home.sessionPath = [
        "$XDG_BIN_HOME"
    ];

# This value determines the Home Manager release that your configuration is
# compatible with. This helps avoid breakage when a new Home Manager release
# introduces backwards incompatible changes.
#
# You should not change this value, even if you update Home Manager. If you do
# want to update the value, then make sure to first check the Home Manager
# release notes.
    home.stateVersion = "24.05"; # Please read the comment before changing.

# Let Home Manager install and manage itself.
    programs.home-manager.enable = true;
}
