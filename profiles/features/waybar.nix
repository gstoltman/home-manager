{ pkgs, config, ... }: 
{
  programs.waybar = {
    enable = true;
    settings = {
      primary = {
        layer = "top";
        position = "left";
        modules-left = [ "sway/workspaces" ];
        modules-center = [];
        modules-right = [ "clock" ];
      };
    };
    style = ''
      window#waybar {
        min-width: 48px;
      }
    '';
  };
}
