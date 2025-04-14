{config, lib, pkgs, inputs, ...}:

{
  home.file = {
    "alacritty.toml" = {
      source = ../../dotfiles/alacritty/alacritty.toml;
      target = ".config/alacritty/alacritty.toml";
    };
  };
  home.file = {
    "catpuccin-frappe.toml" = {
      source = ../../dotfiles/alacritty/catpuccin-frappe.toml;
      target = ".config/alacritty/catpuccin-frappe.toml";
    };
  };
}