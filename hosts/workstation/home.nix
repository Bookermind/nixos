{config, lib, pkgs, inputs, ...}:

{
        home.homeDirectory = "/home/${config.user.userName}";
        home.stateVersion = "24.11"; # Use the latest version of home-manager
        programs.home-manager.enable = true; # Enable home-manager
        programs.zsh = {
                enable = true;
                enableCompletions = true;
                autosuggestions.enable = true;
                syntaxHighlighting.enable = true;
                
                shellAlliases = {
                        ll = "ls -lah";
                        update = "sudo nixos-rebuild switch --flake ~/nixos#workstation";
                };
                zplug = {
                        enable = true;
                        plugins = [
                                {name = "zsh-users/zsh-autosuggestions";}
                                {name = "romkatv/powerlevel10k";}
                                {name = "zsh-users/zsh-syntax-highlighting";}
                        ];
                };
        };
}