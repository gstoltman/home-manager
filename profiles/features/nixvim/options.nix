{
  programs.nixvim = {
    clipboard = {
      register = "unnamedplus";
      providers.xclip.enable = true;
    };

    opts = {
      tabstop = 4;
      shiftwidth = 2;
      expandtab = true;
      autoindent = true;
      textwidth = 0;
    };
  };
}
