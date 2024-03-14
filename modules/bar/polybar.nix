{ pkgs, ... }: {
  home.packages = with pkgs; [
    polybar    

    # Packages required by some rofi's applets
    maim 
    dunst 
    xclip 
    viewnior 
    xdotool
  ];

  home.file = {
    ".config/polybar".source = ../../resources/dotfiles/polybar;
  };
}