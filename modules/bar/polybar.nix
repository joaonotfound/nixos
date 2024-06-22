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
}