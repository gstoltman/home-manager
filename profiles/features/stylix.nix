{config, lib, pkgs, stylix, ...}:

{
  stylix = {
    enable = true;
    image = ../../assets/everforest-wallpaper2.jpg;
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
      monospace = {
        package = pkgs.nerd-fonts.zed-mono;
        name = "ZedMono Nerd Font Mono";
      };
      emoji = {
        package = pkgs.noto-fonts-emoji;
        name = "Noto Color Emoji";
      };
      sizes = {
        desktop = 20;
        applications = 12;
        terminal = 16;
        popups = 12;
      };
    };


    targets.firefox.profileNames = [ "vpkfk14y.default" ];

    opacity = {
      terminal = 0.80;
    };
  };
}
