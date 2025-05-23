{config, lib, pkgs, stylix, ...}:

{
  #home.packages = with pkgs; [
  #  nerd-fonts.zed-mono
  #];

  stylix = {
    enable = true;
    image = ../../assets/everforest-wallpaper.jpg;
    polarity = "dark";
    base16Scheme = ../../assets/themes/everforest.yaml;
    fonts = {
      #serif = {
      #  package = pkgs.nerd-fonts.zed-mono;
      #  name = "ZedMono Nerd Font Mono";
      #};
      #sansSerif = {
      #  package = pkgs.nerd-fonts.zed-mono;
      #  name = "ZedMono Nerd Font Mono";
      #};
      emoji = {
        package = pkgs.noto-fonts-emoji;
        name = "Noto Color Emoji";
      };
      monospace = {
        package = pkgs.nerd-fonts.zed-mono;
        name = "ZedMono Nerd Font Mono";
      };
      sizes = {
        desktop = 12;
        applications = 12;
        terminal = 16;
        popups = 12;
      };
    };

    opacity = {
      terminal = 0.80;
    };
  };
}
