{
    description = "NixOS System Configuration Flake";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
        #home-manager = {
        #    url = "github:nix-community/home-manager";
        #    inputs.nixpkgs.follows = "nixpkgs";
        #};
    };
    outputs = { self, nixpkgs, ...}@inputs: {
        nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
            specialArgs = {inherit inputs;};
            modules = [
                ./system/configuration.nix
                #inputs.home-manager.nixosModules.default
            ];
        };
    };
}