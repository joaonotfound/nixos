{ pkgs, ... }: {
  home.packages = with pkgs; [
    heroic

    # retroarchFull
		# emulationstation-de

    lutris
	  # minecraft
	  prismlauncher
  ];
}

