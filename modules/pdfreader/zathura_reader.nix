{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    zathura
  ];

  # Set Zathura as the default PDF reader
  xdg.mimeApps = {
    enable = true;
    associations.added = {
      "application/pdf" = ["org.pwmt.zathura.desktop"];
    };
    defaultApplications = {
      "application/pdf" = ["org.pwmt.zathura.desktop"];
    };
  };

}
