{ ... }: {
  fileSystems."/" =
    { device = "/dev/disk/by-uuid/8ef36418-e988-4398-a0a9-4e91f6449f8f";
      fsType = "ext4";
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/9908-5FAC";
      fsType = "vfat";
    };

  swapDevices =
    [ { device = "/dev/disk/by-uuid/3ecfd2fb-5fe5-4b73-9844-89b045293924"; }
    ];
}
