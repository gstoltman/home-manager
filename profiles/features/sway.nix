{ pkgs, config, ... }:

let 
  modifier="Mod4";
in {
  wayland.windowManager.sway = {
    enable = true;

    config = {
      inherit modifier;

      bars = [
        { command = "waybar"; }
      ];

      window = {
        border = 0;
        titlebar = false;
        hideEdgeBorders = "both";
      };

      keybindings = {
        # Terminal
        "${modifier}+Return" = "exec ${pkgs.ghostty}/bin/ghostty";

        # Browser
        "${modifier}+f" = "exec ${pkgs.firefox}/bin/firefox";

        # Workspaces
        "${modifier}+1" = "workspace 1";
        "${modifier}+2" = "workspace 2";
        "${modifier}+3" = "workspace 3";
        "${modifier}+4" = "workspace 4";
        "${modifier}+5" = "workspace 5";

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
