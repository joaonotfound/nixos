{ config, pkgs, ... }@inputs: {
  home.packages = with pkgs; [ 
    brave    
    firefox
    google-chrome
  ];
}