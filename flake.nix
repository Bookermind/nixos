{
    description = "NixOS System Configuration Flake";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
        home-manager = {
            url = "github:nix-community/home-manager";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };
    outputs = { self, nixpkgs, ...}@inputs: 
    let
        system = "x86_64-linux";
        pkgs = nixpkgs.legacyPackages.${system};
    in
    {
        nixosConfigurations.workstation = nixpkgs.lib.nixosSystem {
            specialArgs = {inherit inputs system;};
            modules = [
                ./hosts/workstation/configuration.nix
                inputs.home-manager.nixosModules.default
            ];
        };
    };
}