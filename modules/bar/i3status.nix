{ config, pkgs, ... }@inputs: {
  home.file = {
    ".config/i3status".source = ../../resources/dotfiles/i3status;
  };
}