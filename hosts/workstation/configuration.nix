{config, lib, pkgs, inputs, ...}:
let
    mUserEnable = true;
    mUserName = "simon";
    mUserFullname = "Simon Booker";
    mUserShell = pkgs.zsh;
in
{
    imports = [
        ./hardware-configuration.nix
        ../../users/main-user.nix
        ../../modules/nixos/packages.nix
        ./home.nix
        inputs.home-manager.nixosModules.default
    ];

    #Enable Flakes
    nix.settings.experimental-features = [ "nix-command" "flakes" ];

    #Bootloader settings
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    #Network settings
    networking.hostName = "nixos"; # Define your hostname.
    networking.networkmanager.enable = true; # Enable NetworkManager for managing network connections.

    # Time settings
    time.timeZone = "Europe/London"; # Set your timezone.
    i18n.defaultLocale = "en_GB.UTF-8"; # Set your locale.
    console.useXkbConfig = true;
    # Enable the X11 windowing system.
    services.xserver = {
        enable = true;
        windowManager.qtile.enable = true; # Enable the Qtile window manager.
        xkb.layout = "gb"; # Set the keyboard layout to UK.
    };

    #Define main user details passed into the mainuser function and home manager
    main-user.enable = mUserEnable;
    main-user.userName = mUserName;
    main-user.fullname = mUserFullname;
    main-user.shell = mUserShell;
    user.enable = mUserEnable;
    user.userName = mUserName;
    home-manager = {
        extraSpecialArgs = {inherit inputs;};
        users = {
            "${mUserName}" = import ./home.nix;
        };
    };
    
    system.stateVersion = "24.11";
}