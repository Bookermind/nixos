{config, lib, pkgs, ...}:

{
    imports = [
        ./hardware-configuration.nix
        ./users/main-user.nix
        ./packages.nix
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
    # Enable the X11 windowing system.
#    services.xserver = {
#        enable = true;
#        windowManager.qtile.enable = true; # Enable the Qtile window manager.
#        xkb.layout = "gb"; # Set the keyboard layout to UK.
#    };

    main-user.enable = true;
    main-user.userName = "simon";
#    #Define User Accounts
#    users.users.simon = {
#        isNormalUser = true;
#        hashedPassword = "$y$j9T$ozspdfWV7iOjWN0Bw6MrW1$sPWIDwrOoifkFQn8W/Qa84zcO1d7pnQyhPbBU6Tn2k5";
#        extraGroups = [ "wheel" ]; # Add user to wheel.
#        packages = with pkgs; [
#            tree
#        ];
#    };

    #Define System Packages
#    environment.systemPackages = with pkgs; [
#        wget
#        vim
#        git
#        neovim
#        alacritty
#    ];
    system.stateVersion = "24.11";
}