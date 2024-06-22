{ pkgs, ... }: {
  home.packages = with pkgs; [ 
    brave    
    firefox
    google-chrome
    tor-browser-bundle-bin
  ];
}