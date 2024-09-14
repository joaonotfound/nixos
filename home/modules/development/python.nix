{ pkgs, ... }: {
  home.packages = with pkgs; [
    python39
    python310Packages.pip
  ];
}