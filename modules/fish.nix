{ config, pkgs, ... }@inputs: {
  home.packages = with pkgs; [ 
    fish
    zoxide
  ];

  programs.fish = {
    enable = true;
    shellInit = ''zoxide init fish | source'';
  };
}
