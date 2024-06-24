{
  programs.nixvim = {
    clipboard = {
      register = "unnamedplus";
      providers.wl-copy.enable = true;
    };

    opts = {
      tabstop = 4;
      shiftwidth = 4;
      expandtab = true;
      autoindent = true;
      textwidth = 0;
    };
  };
}
