{ pkgs, ... }: {
  home.packages = with pkgs; [ picom ];

  home.file = {
    ".config/picom".source = ../../../resources/dotfiles/picom;    
  };
}