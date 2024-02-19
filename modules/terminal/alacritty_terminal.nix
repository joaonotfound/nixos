{ config, pkgs, ... }@inputs: {
  home.packages = with pkgs; [
    alacritty
    tabbed
  ];

  home.file = {
    ".config/alacritty".source = ../../resources/dotfiles/alacritty;
  };
}