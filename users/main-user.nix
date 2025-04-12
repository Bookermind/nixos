{lib, config, pkgs, ...}:
let
    cfg = config.main-user;
in
{
    options.main-user = {
        enable = lib.mkEnableOption "Enable user module";
        
        userName = lib.mkOption {
            default = "mainuser";
            description = ''
                username
            '';
        };
    };
    config = lib.mkIf cfg.enable {
        users.users.${cfg.userName} = {
            isNormalUser = true;
            description = "Main User";
            hashedPassword = "$y$j9T$ozspdfWV7iOjWN0Bw6MrW1$sPWIDwrOoifkFQn8W/Qa84zcO1d7pnQyhPbBU6Tn2k5";
            extraGroups = [ "wheel" ]; # Add user to wheel.
            shell = pkgs.zsh;
            packages = with pkgs; [
                zsh
            ];
        };
    };
}