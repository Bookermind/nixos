{config, lib, pkgs, inputs, ...}:

{
        imports = [
                ../../modules/home-manager/zsh.nix
        ];
        home.homeDirectory = "/home/${config.user.userName}";
        home.stateVersion = "24.11"; # Use the latest version of home-manager
        programs.home-manager.enable = true; # Enable home-manager
}