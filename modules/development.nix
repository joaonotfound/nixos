{ config, pkgs, ... }@inputs: {

  home.packages = with pkgs; [
    vim
    emacs
    jetbrains.idea-community
    android-studio
    vscode
    go
    cargo
    rustc
    gcc
    gnumake
    opam
    jdk17
    maven
    gradle
    nodejs_20
    yarn
    flutter
    git
    nsis
  ];
}
