{ pkgs, config, ... }:

{
  programs.git = {
    enable = true;
    settings = {
      user.name = "gstoltman";
      user.email = "gstoltman@gmail.com";
    };
  };
}
