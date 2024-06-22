{ config, pkgs, ... }: {
  imports = [
    ../modules/nitrogen.nix
    ../modules/development
    ../modules/shells/fish.nix
    ../modules/bar/polybar.nix
    ../modules/games.nix
    ../modules/editors/vscode.nix
    ../modules/editors/neovim.nix
    ../modules/bluetooth.nix
    ../modules/fonts.nix
    ../modules/browser.nix
    ../modules/terminal/kitty.nix
    ../modules/reading/zathura.nix
    ../modules/audio/rhythmbox.nix
    ../modules/images/shotwell.nix
  ];
  
  home.username = "joaonotfound";
  home.homeDirectory = "/home/joaonotfound";

  home.stateVersion = "23.05";

  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [   
    spotify
    pavucontrol
    discord
    i3
    bitwarden
    bisq-desktop
    zip
    gzip
    stow
    anki
    openvpn
    killall
    ranger
    sshfs
    flameshot
    peek
    lxappearance
    btop
    dbeaver
    obs-studio
    obsidian
    direnv
    qbittorrent
    nixpkgs-fmt
    electrum
    tradingview
    onlyoffice-bin
    libsForQt5.okular
    calibre
    foliate
  ];
  
  # Set GTK's dark mode
  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
  };

  home.file = {
    "wallpapers".source = ../resources/wallpapers;    
  };

  xdg = {
    enable = true;
    mimeApps.defaultApplications = {
      "text/plain" = "emacs.desktop";
    };
  };

  home.sessionVariables = {
    XDG_CONFIG_HOME = "${config.home.homeDirectory}/.config";
    XDG_DATA_HOME = "${config.home.homeDirectory}/.local/share";
    XDG_CACHE_HOME = "${config.home.homeDirectory}/.cache";
    EDITOR = "emacs";
  };

  programs.home-manager.enable = true;
}
