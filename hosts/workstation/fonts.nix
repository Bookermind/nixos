{config, lib, pkgs, inputs, ...}:

{
  fonts = {
    enableDefaultPackages = true;
    packages = with pkgs; [
      nerd-fonts.jetbrains-mono
      nerd-fonts.fira-mono
      nerd-fonts.fira-code
    ];
    fontconfig.enable = true;
    fontDir.enable = true;
  };
}