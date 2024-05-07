{ pkgs, ... }:
{
  fonts.fontconfig.enable = true;
  home.packages = [
    (pkgs.nerdfonts.override { fonts = [ "ZedMono" ]; })
    #pkgs.twemoji-color-font
    #pkgs.noto-fonts-emoji
  ];

  gtk = {
    enable = true;
    font = {
      name = "ZedMono Nerd Font";
      size = 14;
    };
    #iconTheme = {
    #  name = "Papirus-Dark";
    #  package = pkgs.catppuccin-papirus-folders.override {
    #    flavor = "mocha";
    #    accent = "lavender";
    #  };
    #};
    #theme = {
    #  name = "Catppuccin-Mocha-Compact-Lavender-Dark";
    #  package = pkgs.catppuccin-gtk.override {
    #    accents = [ "lavender" ];
    #    size = "compact";
    #    # tweaks = [ "rimless" ];
    #    variant = "mocha";
    #  };
    #};
    #cursorTheme = {
    #  name = "Nordzy-cursors";
    #  package = pkgs.nordzy-cursor-theme;
    #  size = 22;
    #};
  };
  
  #home.pointerCursor = {
  #  name = "Nordzy-cursors";
  #  package = pkgs.nordzy-cursor-theme;
  #  size = 22;
  #};
}
