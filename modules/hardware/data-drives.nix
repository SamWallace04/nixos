{
  flake.modules.nixos.data-drives = {
    # 2TB CT2000BX500SSD1 (sdc1)
    fileSystems."/media/data" = {
      device = "/dev/disk/by-uuid/e39cfb1f-c108-48c2-acc2-b4dc0ad33ee9";
      fsType = "ext4";
      options = [
        "nodev"
        "nosuid"
        "nofail"
      ];
    };

    # 2TB Samsung SSD 990 PRO (nvme0n1p1)
    fileSystems."/media/data2" = {
      device = "/dev/disk/by-uuid/f2201012-ae6b-4e57-acdc-6d1fdc8b1b90";
      fsType = "ext4";
      options = [
        "nodev"
        "nosuid"
        "nofail"
      ];
    };
  };
}
