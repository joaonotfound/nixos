{ config, pkgs, ... }@inputs: {
  home.packages = with pkgs; [
    vagrant
    terraform
  ];
}