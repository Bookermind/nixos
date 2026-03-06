{ config, pkgs, ... }:

{
  home.username = "simon";
  home.homeDirectory = "/home/simon";
  programs.git.enable = true;
  home.stateVersion = "25.11";
  programs.bash = {
    enable = true;
    shellAliases = {
      hw = "echo Hello World!";
    };
  };
  dconf.enable = true;
  dconf.settings = {
    "org/gnome/desktop/interface" = {
      accent-color = "blue";
    };
    "org/gnome/shell" = {
      disable-user-extensions = false;
      enabled-extensions = [
        pkgs.gnomeExtensions.blur-my-shell
      ];
    };
  };
}
