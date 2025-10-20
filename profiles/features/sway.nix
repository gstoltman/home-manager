{ pkgs, config, ... }:

let 
  modifier="Mod4";
in {
  wayland.windowManager.sway = {
    enable = true;

    config = {
      inherit modifier;

      # Prevents defaulting to swaybar
      bars = [ ];

      input = {
        "type:touchpad" = {
          tap = "enabled";
          natural_scroll = "enabled";
        };
      };

      output = {
        "DP-1" = {
          mode = "3440x1440@144Hz";
          position = "0 0";
        };
        # WIP below
        #"HDMI-A-1" = {
        #  mode = "1920x1080@60Hz";
        #  position = "0 0";
        #};
        "eDP-1" = {
          mode = "1920x1200@60Hz";
        };
      };

      window = {
        border = 0;
        titlebar = false;
        hideEdgeBorders = "both";
      };
      
      gaps = {
        inner = 0;
        outer = 0;
      };

      keybindings = {
        # Terminal
        "${modifier}+Return" = "exec ${pkgs.ghostty}/bin/ghostty";

        # Browser
        "${modifier}+f" = "exec ${pkgs.firefox}/bin/firefox";

        # Menu
        "${modifier}+w" = "exec ${pkgs.wofi}/bin/wofi --show run";

        # Bar Toggle
        "${modifier}+Tab" = "exec ~/.config/sway/toggle-waybar.sh";

        # Workspaces
        "${modifier}+1" = "workspace 1";
        "${modifier}+2" = "workspace 2";
        "${modifier}+3" = "workspace 3";
        "${modifier}+4" = "workspace 4";
        "${modifier}+5" = "workspace 5";

        "${modifier}+shift+1" = "move container to workspace number 1";
        "${modifier}+shift+2" = "move container to workspace number 2";
        "${modifier}+shift+3" = "move container to workspace number 3";
        "${modifier}+shift+4" = "move container to workspace number 4";
        "${modifier}+shift+5" = "move container to workspace number 5";

        # Monitors
        "${modifier}+shift+h" = "move container to output HDMI-A-1";
        "${modifier}+shift+l" = "move container to output DP-1";

        # Misc
        "${modifier}+q" = "kill";
        "${modifier}+shift+f" = "fullscreen toggle";
        "${modifier}+z" = "split h";
        "${modifier}+x" = "split v";
        "${modifier}+r" = "mode resize";

        "${modifier}+h" = "resize grow width 10 px or 10 ppt";
        "${modifier}+l" = "resize shrink width 10 px or 10 ppt";
        "${modifier}+j" = "resize grow height 10 px or 10 ppt";
        "${modifier}+k" = "resize shrink height 10 px or 10 ppt";
      };
    };
  };
}
