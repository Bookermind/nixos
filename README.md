# Repository of nixos configurations  
This repository stores the configurations needed to bootstrap and maintain nixos based systems.

#Repository Structure
## Root Directory
* flake.nix - flake based entry point for system configuration. Current the following system names are supported:
  * simon-test - A Qemu based virtual machine machine running in by promox homelab (used for configuration testing)
* README.md - This file
## Systems
Contains a directory for each system configured in the flake
* configuration.nix - Main nix configuration file called by flake.nix
* disk-config.nix - Configuration for disk partitioning and formatting
* home.nix - skeleton home configuration nix file

# Installation on new hardware
## Setup
First boot up a new machine. Log in and run the following commands:
```bash
sudo loadkeys uk         # Swaps the keyboard layout to UK
lsblk -f            # Lists block devices with filesystem information
```

The name of the main disk drive will be returned by the ```lsblk``` command. You may need to alter the disk-config.nix file to match the name of the main disk drive.   
For example in simon-test ensure that the disk is named ```/dev/vda``` (a virtio block device) rather than ```/dev/sda``` (a virtual sata drive).   
## Partitioning
Clone this repository to the live nix ISO:   
```bash
git clone https://github.com/Bookermind.nixos.git
```
*NOTE* This will clone the repository via https not ssh. Meaning that the resultant local git copy will not be able to be committed back to the remote repository. Once the operating system is bootstraped and installed clone the repo again via ssh.   

Navigate to the clone repository (assumed here to be relative to home) and run the following commands:   
```bash
cd ~/nixos/systems/simon-test
sudo nix --experimental-features "nix-command" "flakes" run github:nix-community/disko/latest -- --mode destroy,format,mount disko-config.nix
```   
*NOTE* This will completely destroy and existing partitions on the disk. Ensure to have everything backed up before proceeding!   
## Installation
Run the nixos installer:
```bash
sudo nixos-install --flake /home/nixos#simon-test
```
*NOTE* Ensure to create a password for your system user account:   
This assumes a user account username of simon.   
```bash
sudo nixos-enter --root /mnt -c 'passwd simon'
```
# REBOOT
