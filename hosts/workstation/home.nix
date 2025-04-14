{config, lib, pkgs, inputs, ...}:

{

        home.homeDirectory = "/home/${config.user.userName}";
        home.stateVersion = "24.11"; # Use the latest version of home-manager
        programs.home-manager.enable = true; # Enable home-manager

}