{ pkgs, ... }:{
  home.packages = with pkgs; [
    vim
    neovim

    ripgrep /** Required to make livegrep plugin work */
  ];
}