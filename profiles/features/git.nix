{ pkgs, config, ... }:

{
  programs.git = {
    enable = true;
    userName = "Grant Stoltman";
    userEmail = "gstoltman@gmail.com";
  };
}
