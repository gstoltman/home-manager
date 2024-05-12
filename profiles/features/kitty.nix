{ pkgs, config, ... }: 
{
  programs.kitty = {
    enable = true;

    font = {
      name = "ZedMono Nerd Font";
    };

    settings = {
      confirm_os_window_close = 0;
    };
  };
}
