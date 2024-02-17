{ config, pkgs, ... }@inputs: {
  home.packages = with pkgs; [
    alacritty
  ];

  home.file = {
    ".config/alacritty".source = ../../resources/dotfiles/alacritty;
  };
}