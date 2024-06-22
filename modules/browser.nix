{ pkgs, ... }: {
  home.packages = with pkgs; [ 
    brave    
    firefox
    google-chrome
  ];
}