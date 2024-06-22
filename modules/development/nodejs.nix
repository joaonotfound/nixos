{ pkgs, ... }: {
  home.packages = with pkgs; [
    nodejs_20

    /** Package managers */
    yarn
    nodePackages.pnpm
  ];
}