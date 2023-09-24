{ config, pkgs, ... }@inputs: {
  home.packages = with pkgs; [ nitrogen ];

  home.file.".config/nitrogen/nitrogen.cfg".text = ''
    [ geometry ]
    posx=-3
    posy=-21
    sizex=463
    sizey=500

    [ nitrogen ] 
    view=icon
    recurse=true
    sort=alpha
    icon_caps=false
    dirs=/home/joaonotfound/wallpapers;
  '';
}
