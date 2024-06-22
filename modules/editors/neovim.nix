{ pkgs }:{
  home.packages = with pkgs; [
    vim
    nvim
  ];
}