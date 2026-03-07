{ config, pkgs, inputs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./disko-config.nix
    inputs.home-manager.nixosModules.default
  ];

  boot = {
    initrd.systemd.enable = true;
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
      timeout =0;
    };
    plymouth = {
      enable = true;
#      theme = "rings";
#      themePackages = with pkgs; [
#        (adi1090x-plymouth-themes.override {
#          selected_themes = [ "rings" ];
#        })
#      ];
    };
    consoleLogLevel = 3;
    initrd.verbose = false;
    kernelParams = [
      "quiet"
      "udev.log_level=3"
      "systemd.show_status=auto"
    ];
  };
  networking = {
    hostName = "simon-test";
    networkmanager.enable = true;
  };

  services = {
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
    gnome = {
      core-apps.enable = true;
      core-developer-tools.enable = false;
      games.enable = false;
    };
    sysprof.enable = true;
  };

  time.timeZone = "Europe/London";
  console.keyMap = "uk";

  home-manager = {
    extraSpecialArgs = { inherit inputs; system = "x86_64-linux"; };
    users = {
      "simon" = import ./home/home.nix;
    };
  };

  users.users.simon = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
  };

  environment = {
    systemPackages = with pkgs; import ./packages.nix { inherit pkgs; };
    gnome.excludePackages = with pkgs; [
      gnome-tour
      cheese
      epiphany
      geary
      totem
      atomix
      gnome-music
      gnome-photos
      hitori
      iagno
      tali
    ];
  };

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  system.stateVersion = "25.11";
}
