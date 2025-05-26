{ pkgs, ... }: 
{
  programs.firefox = {
    enable = true;
    policies = {
      DisplayBookmarksToolbar = true;
      Preferences = {
        "font.name.sans-serif.x-western" = "Zed Mono Nerd Font";
      };
    };
  };
}
