{ pkgs }: {
  home.packages = with pkgs; [
    rofi
  ];

  /** Settings */
  ".config/rofi" = {
    source = ../resources/dotfiles/rofi;
    recursive = true;
  };

  /** Themes */
  ".local/share/rofi/themes" = {
    source = ../resources/rofi-themes-collection/themes;
    recursive = true;
  };
}