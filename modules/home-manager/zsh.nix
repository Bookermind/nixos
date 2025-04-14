{config, lib, pkgs, inputs, ...}:

{
  programs.zsh = {
    enable = true;
  };
  home.file = {
    ".zshrc" = {
      source = ../../dotfiles/zshrc;
      target = ".zshrc";
    };
  };
  home.file = {
    "p10k.zsh" = {
      source = ../../dotfiles/p10k.zsh;
      target = ".p10k.zsh";
    };
  };
}