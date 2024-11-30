{ pkgs, ... }: {
  programs.dconf.enable = true;

  users.users.joaonotfound.extraGroups = [ "libvirtd" "vboxusers" ];

  environment.systemPackages = with pkgs; [
    docker
    virt-manager
    virt-viewer
    spice
    spice-gtk
    spice-protocol
    win-virtio
    win-spice
    gnome.adwaita-icon-theme
  ];

	hardware.nvidia-container-toolkit.enable = true;

  # Manage the virtualisation services
  virtualisation = {
    docker = {
      enable = true;
			enableNvidia = true;
    };
    virtualbox = {
      host = {
        enable = true;
        enableExtensionPack = true;
      };
      guest = {
        enable = true;
      };
    };
    libvirtd = {
      enable = true;
      qemu = {
        swtpm.enable = true;
        ovmf.enable = true;
        ovmf.packages = [ pkgs.OVMFFull.fd ];
      };
    };
    spiceUSBRedirection.enable = true;
  };
  services.spice-vdagentd.enable = true;

}
