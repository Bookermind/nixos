{pkgs, ... }:
with pkgs; [
  nano
  git
  wget
  curl
  sysprof
  zed-editor
  gnomeExtensions.blur-my-shell
  gnomeExtensions.appindicator
  gnomeExtensions.paperwm
]
