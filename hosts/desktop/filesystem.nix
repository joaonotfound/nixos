{ config, pkgs, ... }: {
  fileSystems."/" = {
    device = "/dev/disk/by-uuid/9d9f3b69-2fdb-4212-a54f-92293283667e";
    fsType = "ext4";
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/8BFE-18B7";
    fsType = "vfat";
  };

  fileSystems."/mnt/fat" = {
    device = "/dev/disk/by-label/fat";
    fsType = "ntfs";
  };

  fileSystems."/mnt/backup" = {
    device = "/dev/disk/by-uuid/2479502e-5eab-4f6e-b81d-d70033f61945";
    fsType = "ext4";
  };

  swapDevices = [ ];

}
