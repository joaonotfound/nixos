{ config, pkgs, ... }@inputs: {
  # Activate fonts like Jetbrains 
  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [ 
    (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })    
    jetbrains-mono
    fira-code
  ];
}