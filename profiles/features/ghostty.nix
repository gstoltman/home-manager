{ pkgs, config, ... }: 
{
  programs.ghostty = {
    enable = true;
    #settings = {
    #  confirm_os_window_close = 0;
    #};
  };
}
