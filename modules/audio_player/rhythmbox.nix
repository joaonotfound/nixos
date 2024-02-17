{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    rhythmbox
  ];

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
