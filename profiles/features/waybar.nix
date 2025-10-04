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
        position = "top";
        modules-left = [ "custom/spacer" "custom/icon" "custom/spacer" "sway/workspaces" ];
        modules-center = [ "backlight" "custom/divider" "pulseaudio" "custom/divider" "bluetooth" ];
        modules-right = [ "network" "custom/divider" "battery" "custom/divider" "clock" ];
        "custom/icon" = {
          format = "";
          on-click = "wofi --show drun";
        };
        "custom/divider" = {
          format = " | ";
        };
        "custom/spacer" = {
          format = "   ";
        };
        backlight = {
          format = " {percent}%";
        };
        pulseaudio = {
          format = "♪ {volume}%";
          scroll-step = 5;
          on-click = "pavucontrol";
        };
        bluetooth = {
          format = "";
          on-click = "blueman-manager";
        };
        network = {
          format = "";
          on-click = "nm-connection-editor";
        };
        battery = {
          format = "󰂄 {capacity}%";
        };
        clock = {
          format = " {:%H:%M}";
        };
      };
    };
    style = ''
      #custom-icon {
        font-size: 80px;
      }
    '';
  };
}
