{config, pkgs, inputs,...}:
{
    home.username = ${config.main-user.userName};
    home.homeDirectory = "/home/${config.main-user.userName}";
    home.stateVersion = "24.11"; # Use the latest version of home-manager
    programs.home-manager.enable = true; # Enable home-manager
    
    programs.zsh.enable = true; # Enable Zsh
}