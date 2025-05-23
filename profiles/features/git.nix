{ pkgs, config, ... }:

{
  programs.git = {
    enable = true;
    userName = "gstoltman";
    userEmail = "gstoltman@gmail.com";
  };
}
