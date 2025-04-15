{lib, config, pkgs, ...}:

{
    nixpkgs.config.allowUnfree = true;  # Allow unfree packages
    environment.systemPackages = with pkgs; [
        wget
        vim
        git
        neovim
        alacritty
        zsh
        zoxide
        fzf
    ];
}