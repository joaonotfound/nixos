{ config, pkgs, ... }@inputs: {
  home.packages = with pkgs; [ 
    fish
  ];

  programs.fish = {
    enable = true;
  };
}