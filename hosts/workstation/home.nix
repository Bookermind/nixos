{config, lib, pkgs, inputs, ...}:

{
    options.user = {
        enable = lib.mkEnableOption "Enable Home Manager";
        userName = lib.mkOption {
            default = "mainuser";
            description = ''
                Username for the user.
            '';
        };
    };
    config = lib.mkIf config.user.enable {
        home.username = config.user.userName;
        home.homeDirectory = "/home/${config.user.userName}";
        programs.zsh.enable = true; # Enable Zsh
        home.stateVersion = "24.11"; # Use the latest version of home-manager
        programs.home-manager.enable = true; # Enable home-manager
    };       
    
}