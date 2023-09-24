{ config, pkgs, ... }: {
  fileSystems."/" = {
    device = "/dev/disk/by-uuid/9d8fdc38-1eca-4025-9d21-132f59803ccb";
    fsType = "ext4";
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/20D1-B535";
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
