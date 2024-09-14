{ pkgs }: {
  home.packages = with pkgs; [ picom ];

  ".config/picom".source = ../../../resources/dotfiles/picom;    
}