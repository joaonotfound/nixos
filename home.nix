{ config, pkgs, ... }:

{
  home.username = "joaonotfound";
  home.homeDirectory = "/home/joaonotfound";

  home.stateVersion = "23.05";

  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })
    vim emacs jetbrains.idea-ultimate vscode
    alacritty
    spotify pavucontrol
    discord
    brave
    steam lutris
    zathura
    git
    jdk17 maven gradle
    nodejs_20 yarn
    flutter37
    i3 polybar nitrogen rofi picom
    bitwarden
    go
    pcloud
    gnumake
    zip gzip
    stow
    jetbrains-mono fira-code
    anki
    openvpn
    killall
 ];

 # Activate fonts like Jetbrains 
 fonts.fontconfig.enable = true;

 # Set GTK's dark mode
 dconf.settings = {
  "org/gnome/desktop/interface" = {
    color-scheme = "prefer-dark";
  };
 };

 gtk = {
    enable = true;
    font.name = "Victor Mono SemiBold 12";
    theme = {
      name = "SolArc-Dark";
      package = pkgs.solarc-gtk-theme;
    };
 };

 home.file = {
   # ---- CONFIG FILES ---------
   ".config/i3".source = ./dotfiles/i3; 
   ".config/nitrogen".source = ./dotfiles/nitrogen;
   ".config/picom".source = ./dotfiles/picom;
   ".config/polybar".source = ./dotfiles/polybar;
   ".config/alacritty".source = ./dotfiles/alacritty;
   ".config/rofi" = {
     source = ./dotfiles/rofi;
     recursive = true;
   };

  # ----- LOCAL FILES ----------
  ".local/share/rofi" = {
     source = ./rofi-themes;
     recursive = true;
   };

 };

 home.sessionVariables = {
    EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
