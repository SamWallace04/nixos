# PLACEHOLDER: replace this file with the VM's real hardware config:
#   cp /etc/nixos/hardware-configuration.nix ~/nixos-config/modules/hosts/nixvm/_hardware.nix
# The leading "_" stops import-tree from treating it as a flake-parts module.
{ lib, modulesPath, ... }:
{
  imports = [ (modulesPath + "/profiles/qemu-guest.nix") ];

  # Dummy values so `nix flake check` evaluates before you copy the real file in.
  fileSystems."/" = lib.mkDefault {
    device = "/dev/disk/by-label/nixos";
    fsType = "ext4";
  };
  fileSystems."/boot" = lib.mkDefault {
    device = "/dev/disk/by-label/boot";
    fsType = "vfat";
  };
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
}
