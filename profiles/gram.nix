{ config, pkgs, inputs , ... }:
{
    home.username = "grant";
    home.homeDirectory = "/home/grant";

    nixpkgs.config.allowUnfreePredicate = _: true;

    imports = [
      inputs.nix-colors.homeManagerModules.default
      ./features/alacritty.nix
      ./features/starship.nix
      ./features/vscode.nix
    ];

    colorScheme = inputs.nix-colors.colorSchemes.everforest;
    
    programs = {
	#gtk = {
	#  enable = true;
	#};
	#qt = {
	#  enable = true;
	#  platformTheme = "gtk";
	#  style.name = "breeze";
	#};
    };

    home.packages = with pkgs; [
        #alacritty
	bat
	btop
	discord
	firefox
	#fzf
	git
	#jq
	neofetch
	neovim
	obsidian
	#ripgrep
	starship
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
        #alacritty = {
        #    recursive = true;
        #    source = ../dotfiles/alacritty;
        #    target = "./.config/alacritty";
        #};
        #tmux = {
        #    source = ../dotfiles/tmux/tmux.conf;
        #    target = "./.tmux.conf";
        #};
        git = {
            recursive = true;
            source = ../dotfiles/git;
            target = "./.config/git";
        };
        bash = {
            recursive = false;
            source = ../dotfiles/bash/bashrc;
            target = "./.bashrc";
        };
	#starship = {
	#  recursive = false;
	#  source = ../dotfiles/starship/starship.toml;
	#  target = "./.config/starship.toml";
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
