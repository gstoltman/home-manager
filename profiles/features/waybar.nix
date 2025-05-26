{ config, lib, pkgs, ... }: 
{
  home.file.".config/sway/toggle-waybar.sh" = {
    text = ''
      #!/usr/bin/env bash
      PIDFILE="$XDG_RUNTIME_DIR/waybar-toggle.pid"

      if [ -f "$PIDFILE" ]; then
        if kill -0 "$(cat "$PIDFILE")" 2>/dev/null; then
          kill "$(cat "$PIDFILE")"
          rm "$PIDFILE"
          exit 0
        else
          # Stale PID file
          rm "$PIDFILE"
        fi
      fi

      waybar & echo $! > "$PIDFILE"
    '';
    executable = true;
  };

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
