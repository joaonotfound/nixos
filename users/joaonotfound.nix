{ config, pkgs, ... }@inputs:
{
  users.users.joaonotfound = {
    isNormalUser = true;
    shell = "/run/current-system/sw/bin/zsh";
    description = "joaonotfound";
    extraGroups = [ "networkmanager" "wheel" "docker" "disk" ];
    packages = with pkgs; [ zsh ];
  };
}
