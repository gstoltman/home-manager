{config, lib, pkgs, stylix, ...}:

{
  stylix = {
    enable = true;
    image = ../../assets/everforest-wallpaper.jpg;
    polarity = "dark";
    base16Scheme = ../../assets/themes/everforest.yaml;
    fonts = {
      monospace ={
        package = pkgs.nerd-fonts.zed-mono;
        name = "ZedMono Nerd Font";
      };
      sizes = {
        desktop = 12;
        applications = 12;
        terminal = 20;
        popups = 12;
      };
    };

    opacity = {
      terminal = 0.80;
    };
  };
}
