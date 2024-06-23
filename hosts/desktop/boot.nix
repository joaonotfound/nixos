{ config, ... }: {
  boot.initrd.availableKernelModules = [ "xhci_pci" "ahci" "nvme" "usb_storage" "usbhid" "sd_mod" ];

 #  boot.initrd.kernelModules = [ 	
	# 	"v4l2loopback"
	# ];

  # boot.extraModulePackages = with config.boot.kernelPackages; [ v4l2loopback ];

  boot.loader.systemd-boot.enable = true;

  boot.loader.efi.canTouchEfiVariables = true;

  boot.supportedFilesystems = [ "ntfs" ];

  # boot.kernelModules = [ "kvm-amd" "kvm-intel" ];
}
