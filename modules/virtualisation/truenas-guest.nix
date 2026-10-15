{
  # Guest-side config for a VM running under TrueNAS (QEMU/KVM).
  # In TrueNAS: use VirtIO for disk + NIC, UEFI boot, and tick "discard" on the zvol disk if offered.
  flake.modules.nixos.truenas-guest =
    { pkgs, ... }:
    {
      services.qemuGuest.enable = true; # TrueNAS can see IP / do clean shutdowns
      services.spice-vdagentd.enable = true; # clipboard + resize in the SPICE console

      boot.initrd.availableKernelModules = [
        "virtio_pci"
        "virtio_blk"
        "virtio_scsi"
        "virtio_net"
        "ahci"
        "sr_mod"
      ];

      # Serial console so TrueNAS's "Serial Shell" works when the display doesn't.
      boot.kernelParams = [
        "console=tty0"
        "console=ttyS0,115200"
      ];

      # Return freed blocks to the thin-provisioned zvol.
      services.fstrim.enable = true;

      # No GPU acceleration by default -> Mesa llvmpipe software rendering.
      hardware.graphics.enable = true;
      environment.sessionVariables = {
        # Uncomment if Hyprland refuses to start on the emulated display:
        # LIBGL_ALWAYS_SOFTWARE = "1";
      };

      # Optional: mount a TrueNAS dataset over NFS (on-demand, won't block boot).
      # environment.systemPackages = [ pkgs.nfs-utils ];
      # fileSystems."/mnt/tank" = {
      #   device = "192.168.1.10:/mnt/tank/share";
      #   fsType = "nfs";
      #   options = [ "x-systemd.automount" "noauto" "x-systemd.idle-timeout=600" "nfsvers=4.2" ];
      # };
    };

  # Hyprland rendering tweaks for this VM live in the dotfiles repo: hypr/hosts/nixvm.lua
}
