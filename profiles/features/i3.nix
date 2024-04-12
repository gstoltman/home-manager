{ pkgs, lib, ... }:

let
  modifier = "Mod4";
in {
  xsession = {
    enable = true;
    windowManager.i3 = {
      enable = true;
      package = pkgs.i3-gaps;
      config = {
        inherit modifier;

        bars = [ ];

        window = {
          border = 0;
          hideEdgeBorders = "both";
        };

        gaps = {
          inner = 8;
          outer = 5;
        };

	      fonts = ["Iosevka Nerd Font Mono"];

        keybindings = {
        # logout
        "${modifier}+Shift+e" = "exec i3-msg exit";
          
        # Alacritty terminal
        "${modifier}+Return" = "exec ${pkgs.alacritty}/bin/alacritty";

	      # Firefox
	      "${modifier}+f" = "exec ${pkgs.firefox}/bin/firefox";

        # Rofi
        #"${modifier}+d" = "exec ${pkgs.rofi}/bin/rofi -show drun";

        # Screenshot
        #"${modifier}+shift+s" = "exec ${pkgs.flameshot}/bin/flameshot gui -c";
        #"${modifier}+shift+a" = "exec ${pkgs.flameshot}/bin/flameshot gui";

        # Movement
        "${modifier}+j" = "focus down";
        "${modifier}+k" = "focus up";
        "${modifier}+h" = "focus left";
        "${modifier}+l" = "focus right";

        # Workspaces
	      "${modifier}+1" = "workspace 1";
        "${modifier}+2" = "workspace 2";
        "${modifier}+3" = "workspace 3";
	      "${modifier}+4" = "workspace 4";
	      "${modifier}+5" = "workspace 5";
	      "${modifier}+6" = "workspace 6";

        # Misc
        "${modifier}+q" = "kill";
        "${modifier}+shift+f" = "fullscreen toggle";
        "${modifier}+z" = "split h";
        "${modifier}+x" = "split v";
        "${modifier}+r" = "mode resize";
      };

      modes.resize = {
        "h" = "resize grow width 10 px or 10 ppt";
        "j" = "resize shrink height 10 px or 10 ppt";
       "k" = "resize grow height 10 px or 10 ppt";
        "l" = "resize shrink width 10 px or 10 ppt";
       "Escape" = "mode default";
      };

      startup = [
        {
          command = "${pkgs.xmousepasteblock}/bin/xmousepasteblock";
          always = true;
          notification = false;
        }
        #{
        #  command = "${pkgs.feh}/bin/feh --bg-fill ~/.background.webp";
        #  always = true;
        #  notification = false;
        #}
        {
          command = "systemctl --user restart polybar.service";
          always = true;
          notification = false;
        }
        {
          command = "${pkgs.xbanish}/bin/xbanish";
          always = true;
          notification = false;
        }
        {
          command = "${pkgs.alacritty}/bin/alacritty";
          always = false;
          notification = false;
        }
      ];
      };
    };
  };
  home.file.".background.webp".source = ../../assets/everforest-wallpaper.jpg;
}
