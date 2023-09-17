{ config, pkgs, ... }:

{

  programs.dconf.enable = true;

  users.users.joaonotfound.extraGroups = [ "libvirtd" "vboxusers" ];

  # Install necessary packages
  environment.systemPackages = with pkgs; [
    virt-manager
    virt-viewer
    spice spice-gtk
    spice-protocol
    win-virtio
    win-spice
    gnome.adwaita-icon-theme
  ];

  # Manage the virtualisation services
  virtualisation = {
    docker = {
      enable = true;
    };
    virtualbox = {
      host = {
        enable = true;
        enableExtensionPack = true;
      }; 
      guest = {
        enable = true;
        x11 = true;
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