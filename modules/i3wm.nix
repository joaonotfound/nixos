{ config
, pkgs
, ...
}@inputs: {

  environment.systemPackages = with pkgs; [
    i3
  ];

  services.xserver = {
    enable = true;
    videoDrivers = [ "nvidia" ];
    desktopManager = {
      gnome.enable = true;
      # xterm.enable = true;
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
