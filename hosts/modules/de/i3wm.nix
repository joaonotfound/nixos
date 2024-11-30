{ pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    i3
		gnome.gnome-themes-extra
  ];

	xdg.portal.enable = true;
  services.xserver = {
    enable = true;
    desktopManager = {
      gnome.enable = true;
    };
    displayManager = {
      gdm.enable = true;
      defaultSession = "none+i3";
    };
    windowManager.i3 = {
      enable = true;
    };
  };
}
