{ pkgs, ... }: {
  home.packages = with pkgs; [
    tilix
  ];
}