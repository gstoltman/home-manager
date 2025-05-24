{ pkgs, config, ... }: 
{
  programs.waybar = {
    enable = true;
    settings = {
      primary = {
        layer = "top";
        position = "left";
        modules-left = [ "sway/workspaces" ];
        modules-center = [ "backlight" "pulseaudio" ];
        modules-right = [ "battery" "clock" ];
        pulseaudio = {
          format = "{volume}% 🔊";
          scroll-step = 5;
          on-click = "pavucontrol";
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
