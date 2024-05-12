{ pkgs, config, ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;
    package = pkgs.hyprland;
    xwayland.enable = true;
    settings = {
      input = {
        touchpad.natural_scroll = true;
      };

      general = {
        "$mainMod" = "SUPER";
        #layout = "dwindle";
        gaps_in = 1;
        gaps_out = 1;
        border_size = 0;
        border_part_of_window = false;
        no_border_on_floating = false;
      };

      misc = {
        disable_hyprland_logo = true;
      };

      decoration = {
        rounding = 0;
      };

      bind = [
        # show keybinds
        "$mainMod, F1, exec, show-keybinds"
      
        # keybindings
        "$mainMod, Return, exec, kitty"
        "$mainMod, Q, killactive,"
        "$mainMod, F, exec, firefox"
        "$mainMod SHIFT, F, fullscreen, 0"

        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"

        "$mainMod SHIFT, 1, movetoworkspacesilent, 1"
        "$mainMod SHIFT, 2, movetoworkspacesilent, 2"
        "$mainMod SHIFT, 3, movetoworkspacesilent, 3"
        "$mainMod SHIFT, 4, movetoworkspacesilent, 4"
        "$mainMod SHIFT, 5, movetoworkspacesilent, 5"

        # laptop brightness
        #",XF86MonBrightnessUp, exec, brightnessctl set 10%+"
        #",XF86MonBrightnessDown, exec, brightnessctl set 10%-"
        "$mainMod, O, exec, brightnessctl set 10%+"
        "$mainMod, P, exec, brightnessctl set 10%-"

      ];
    };
  };
}
