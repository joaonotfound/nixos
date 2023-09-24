{ config, pkgs, ... }@inputs: {
  home.packages = with pkgs; [ nitrogen ];

  home.file.".config/nitrogen/nitrogen.cfg".source = ../resources/dotfiles/nitrogen/nitrogen.cfg;
}
