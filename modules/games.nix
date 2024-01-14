{ config, pkgs, ... }@inputs: {
  environment.systemPackages = with pkgs; [
    steam
    heroic
    retroarch
  ];

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
  };
}

