{config, lib, pkgs, stylix, ...}:

{
  stylix = {
    #wallpaper = config.lib.stylix.types.wallpaper.from.image {
    #  file = ../../assets/everforest-wallpaper.jpg;
    #  polarity = "dark";
    #  };
    image = ../../assets/everforest-wallpaper.jpg;
    polarity = "dark";
    base16Scheme = ../../assets/themes/everforest.yaml;
    fonts = {
#      serif = {
#        package = with pkgs; (nerdfonts.override { fonts = [ "ZedMono" ]; });
#	       name = "ZedMono Nerd Font";
#      };
#      sansSerif = {
#        package = with pkgs; (nerdfonts.override { fonts = [ "ZedMono" ]; });
#        name = "ZedMono Nerd Font";
#      };
      monospace = {
        package = with pkgs; (nerdfonts.override { fonts = [ "ZedMono" ]; });
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
