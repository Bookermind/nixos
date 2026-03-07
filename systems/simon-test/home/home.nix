{ config, pkgs, lib, ... }:

{
  home.username = "simon";
  home.homeDirectory = "/home/simon";
  home.packages = with pkgs; [
    tree
    inputs.zen-browser.packages."${system}".specific
  ];
  programs.git = {
    enable = true;
    userName = "simon booker";
    userEmail = "simon.booker@zoho.eu";
  };
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
      color-scheme = "prefer-dark";
      accent-color = "purple";
    };
    "org/gnome/shell" = {
      disable-user-extensions = false;
      enabled-extensions = [
        pkgs.gnomeExtensions.blur-my-shell.extensionUuid
        pkgs.gnomeExtensions.appindicator.extensionUuid
        pkgs.gnomeExtensions.paperwm.extensionUuid
      ];
    };
    "org/gnome/desktop/input-sources" = {
      sources = [
        (lib.gvariant.mkTuple ["xkb" "gb"])
      ];
    };
  };
}
