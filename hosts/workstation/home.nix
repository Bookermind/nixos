{config, lib, pkgs, inputs, ...}:

{
        imports = [
                ../../modules/home-manager/zsh.nix
                ../../modules/home-manager/alacritty.nix
        ];
        #TODO : Need to make this use a variable rather than hard coding
        home.homeDirectory = "/home/simon";
        home.stateVersion = "24.11"; # Use the latest version of home-manager
        programs.home-manager.enable = true; # Enable home-manager
}