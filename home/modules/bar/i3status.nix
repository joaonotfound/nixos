{ pkgs, ... }: {
  home.packages = with pkgs; [ i3status ];
}