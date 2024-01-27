{ pkgs, ... }: {    
  gtk = {
    enable = true;
    font.name = "Victor Mono SemiBold 12";
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };
    cursorTheme = {
      name = "Graphite dark Cursors";
      package = pkgs.graphite-cursors;
    };
    theme = {
      name = "Colloid-Dark";
      package = pkgs.colloid-gtk-theme;
    };
  };
}