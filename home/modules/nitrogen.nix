{ pkgs, ... }: {
  home.packages = with pkgs; [ 
		nitrogen
		gnome.gnome-themes-extra
	];

  home.file.".config/nitrogen/nitrogen.cfg".source = ../../resources/dotfiles/nitrogen/nitrogen.cfg;
}
