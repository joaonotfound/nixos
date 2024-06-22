{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    /** Gnome Extensions */
    (callPackage ../../packages/gnome/extensions/pomodoro/default.nix {})
		gnome.gnome-tweaks
		gnomeExtensions.pop-shell
		gnomeExtensions.unite
		gnomeExtensions.caffeine
		gnomeExtensions.dash-to-dock
		gnomeExtensions.vitals
  ];

	xdg.portal.enable = true;

  services.xserver = {
    enable = true;
    videoDrivers = [ "nvidia" ];

    desktopManager = {
			gnome.enable = true;
    };

    displayManager = {
      gdm.enable = true;
    };
  };
}
