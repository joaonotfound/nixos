{ config, pkgs, ... }: {
  fileSystems."/" = {
    device = "/dev/disk/by-uuid/1859050a-13a6-470c-8894-cbfb6df8107d";
    fsType = "ext4";
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/DD5B-72F9";
    fsType = "vfat";
  };

  fileSystems."/mnt/ssd" = {
    device = "/dev/disk/by-uuid/cfd1ef93-124c-4967-beab-0439d919ebf2";
    fsType = "ext4";
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
