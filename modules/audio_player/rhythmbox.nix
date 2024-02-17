{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    rhythmbox
  ];

  # Set Zathura as the default PDF reader
  xdg.mimeApps = {
    enable = true;
    associations.added = {
      "audio/mpeg" = ["rhythmbox.desktop"];
    };
    defaultApplications = {
       "audio/mpeg" = ["rhythmbox.desktop"];
    };
  };

}
