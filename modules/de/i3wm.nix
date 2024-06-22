{ pkgs, ...}: {
  imports = [
    ../../themes/gnome/colloid-papirus.nix
  ];
  
  environment.systemPackages = with pkgs; [
    i3
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
      defaultSession = "none+i3";
    };
    windowManager.i3 = {
      enable = true;
    };
  };

  # Configuration file
  ".config/i3".source = ../resources/dotfiles/i3;
}
