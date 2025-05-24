{ pkgs, config, ... }: 
{
  programs.waybar = {
    enable = true;
    settings = {
      primary = {
        layer = "top";
        position = "left";
        modules-left = [ "sway/workspaces" ];
        modules-center = [ "backlight" "pulseaudio" "tray" "sway-mode" ];
        modules-right = [ "battery" "clock" ];
        backlight = {
          format = "L {}";
        };
      };
    };
    style = ''
      window#waybar {
        min-width: 48px;
      }
    '';
  };
}
