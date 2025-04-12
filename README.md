# Respository of nixos configurations  
This repository stores the configurations needed to bootstrap and maintain my nixos based laptop.  

# Installation  
Simply git clone the repository onto your laptop.  

## Initial bootstrap installation (from a minimal nixos iso)   
1. Intitally partition your hard drives using your tool of choice
    TO-DO: Implement disko to introduce a declarative approach here  
2. Mount newly create partitions (this installation assumes an EFI layout)
3. Use ```nixos-generate-config --root /mnt``` to generate a boiler-plate configuration.nix and harware-configuration.nix files.   
4. Copy the created hardware=configuration.nix file into the git repository location
5. Install the system using
```
nixos-install --flake /path/to/repo#hostname
```