{ inputs, lib, config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    inputs.dms.homeModules.dank-material-shell
    inputs.niri.nixosModules.niri
    inputs.dms.homeModules.niri
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "simon-desktop";
  networking.networkmanager.enable = true;

  time.timeZone = "Europe/London";

  programs.dank-material-shell.greeter = {
    enable = true;
    compositor.name = "niri";
  };

  #services.displayManager.ly.enable = true;
  #services.xserver = {
  #  enable = true;
  #  autoRepeatDelay = 200;
  #  autoRepeatInterval = 35;
  #  windowManager.qtile.enable = true;
  #};

  users.users.simon = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    packages = with pkgs; [
      tree
    ];
  };

  programs.firefox.enable = true;
  programs.dank-material-shell = {
    enable = true;
    niri = {
      enableKeybinds = true;
      enableSpawn = true;
    };
    enableSystemMonitoring = true;
    dgop.package = inputs.dgop.packages.${pkgs.system}.default;
  };

  environment.systemPackages = with pkgs; [
    nano
    git
    wget
    foot
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  system.stateVersion = "25.11";
}
