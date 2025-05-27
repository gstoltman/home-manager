{ pkgs, config, ... }: 
{
  programs.ghostty = {
    enable = true;
    settings = {
      "font-family" = "ZedMono Nerd Font";
      "confirm-close-surface" = false;
    };
  };
}
