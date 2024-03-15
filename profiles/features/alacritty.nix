{ pkgs, config, ... }:

{
  programs.alacritty.enable = true;
  programs.alacritty.settings = {
    cursor.style.shape = "Underline";
    window = {
      decorations = "none";
      opacity = 0.8;
    };
    colors = with config.colorScheme.palette; {
      bright = {
        black = "0x${base00}";
        blue = "0x${base0D}";
        cyan = "0x${base0C}";
        green = "0x${base0B}";
        magenta = "0x${base0E}";
        red = "0x${base08}";
        white = "0x${base06}";
        yellow = "0x${base09}";
      };
      cursor = {
        cursor = "0x${base06}";
        text = "0x${base06}";
      };
      normal = {
        black = "0x${base00}";
        blue = "0x${base0D}";
        cyan = "0x${base0C}";
        green = "0x${base0B}";
        magenta = "0x${base0E}";
        red = "0x${base08}";
        white = "0x${base06}";
        yellow = "0x${base0A}";
      };
      primary = {
        background = "0x${base00}";
        foreground = "0x${base06}";
      };
    };
    font = {
      size = 12;
      bold.family = "FiraCode Nerd Font";
      bold_italic.family = "FiraCode Nerd Font";
      italic.family = "FiraCode Nerd Font";
      normal.family = "FiraCode Nerd Font";
    };
  };
}
