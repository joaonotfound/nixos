{ pkgs, ... }: {
  home.packages = with pkgs; [
    alacritty
    tabbed
  ];
}