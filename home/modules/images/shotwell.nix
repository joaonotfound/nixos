{ pkgs, ... }: {
  home.packages = with pkgs; [
    shotwell
  ];

  xdg.mimeApps = {
    enable = true;
    associations.added = {
      "image/jpeg" = ["org.gnome.Shotwell-Viewer.desktop"];
      "image/png" = ["org.gnome.Shotwell-Viewer.desktop"];
    };
    defaultApplications = {
       "image/jpeg" = ["org.gnome.Shotwell-Viewer.desktop"];
       "image/png" = ["org.gnome.Shotwell-Viewer.desktop"];
    };
  };

}
