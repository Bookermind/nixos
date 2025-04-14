{config, lib, pkgs, inputs, ...}:

{
  programs.zsh = {
    enable = true;
  };
  home.file = {
    ".zshrc" = {
      source = ../../dotfiles/zsh/zshrc;
      target = ".zshrc";
    };
  };
  home.file = {
    "p10k.zsh" = {
      source = ../../dotfiles/zsh/p10k.zsh;
      target = ".p10k.zsh";
    };
  };
}