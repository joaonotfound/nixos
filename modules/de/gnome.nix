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
		gnomeExtensions.desktop-icons-ng-ding
		gnomeExtensions.desktop-clock
	];
	xdg.portal.enable = true;

  services.xserver = {
    enable = true;

    desktopManager = {
			gnome.enable = true;
    };

    displayManager = {
      gdm.enable = true;
    };
  };
}
