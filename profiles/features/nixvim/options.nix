{
  programs.nixvim = {
    clipboard = {
      register = "unnamedplus";
      ### FIX option wl-clipboard does not exist
      # providers.wl-clipboard.enable = true;
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
