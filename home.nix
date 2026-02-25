{ config, pkgs, ... }:

{
  home.username = "simon";
  home.homeDirectory = "/home/simon";
  programs.git.enable = true;
  home.stateversion = "25.11";
  programs.bash = {
    enable = true;
    shellAliases = {
      hw = "echo Hello World!";
    };
  };
}
