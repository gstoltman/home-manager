{ pkgs, config, ... }: 
{
  programs.kitty = {
    enable = true;

    font = {
      name = "ZedMono Nerd Font";
      size = 14;
    };

    settings = {
      confirm_os_window_close = 0;
    };
  };
}
