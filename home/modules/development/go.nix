{ config, pkgs, ... }: {
  home.sessionPath = [ "${config.home.homeDirectory}/go/bin" ];

  home.packages = with pkgs; [ go ];
}