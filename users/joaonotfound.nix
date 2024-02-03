{ config, pkgs, ... }@inputs:
{
  users.users.joaonotfound = {
    isNormalUser = true;
    shell = "/etc/profiles/per-user/joaonotfound/bin/fish";
    description = "joaonotfound";
    extraGroups = [ "networkmanager" "wheel" "docker" "disk" "audio" ];
    packages = with pkgs; [ zsh ];
  };
}
