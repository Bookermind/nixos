{ config, lib, pkgs, ...}:

{
  imports = [
    ./harware-configuration.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostname = "simon-desktop";
  networking.networkmanager.enable = true;

  time.timeZone = "Europe/London";

  services.displaymanager.ly.enable = true;
  services.xserver = {
    enable = true;
    autoRepeatDelay = 200;
    autoRepeatInterval = 35;
    windowmanager.qtile.enable = true;
  };

  users.users.simon = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    packages = with pkgs; [
      tree
    ];
  };

  programs.firefox.enable = true;

  environment.systemPackages = with pkgs; [
    nano
    git
    wget
    foot
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes"];
  system.stateVersion = "25.11";
}
