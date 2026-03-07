{ config, pkgs, lib, inputs, system, ... }:
{
  enable = true;
  base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-frappe.yaml";
}
