{lib, config, pkgs, ...}:
let
    cfg = config.main-user;
in
{
    options.main-user = {
        enable = lib.mkEnableOption "Enable user module";
        fullname = lib.mkOption {
            default = "Main User";
            description = ''
                Full name of the user.
            '';
        };
        shell = lib.mkOption {
            default = pkgs.zsh;
            description = ''
                Shell for the user.
            '';
        };
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
            description = cfg.fullname;
            hashedPassword = "$y$j9T$ozspdfWV7iOjWN0Bw6MrW1$sPWIDwrOoifkFQn8W/Qa84zcO1d7pnQyhPbBU6Tn2k5";
            extraGroups = [ "wheel" ]; # Add user to wheel.
            shell = cfg.shell;
        };
    };
}