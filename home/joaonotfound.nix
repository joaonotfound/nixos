{ config, pkgs, ... }: {
  imports = [
    ../modules/nitrogen.nix
    ../modules/development
    ../modules/themes/colloid-papirus.nix
    ../modules/fish.nix
    ../modules/bar/polybar.nix
    ../modules/games.nix
    ../modules/fonts.nix
    ../modules/browsers.nix
    ../modules/terminal/alacritty_terminal.nix
    ../modules/pdf_reader/zathura_reader.nix
    ../modules/audio_player/rhythmbox.nix
    ../modules/image_viewer/shotwell.nix
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
    rofi
    picom
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
  ];
  
  # Set GTK's dark mode
  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
  };

  home.file = {
    # ---- CONFIG FILES ---------
    ".config/i3".source = ../resources/dotfiles/i3;
    "wallpapers".source = ../resources/wallpapers;
    ".config/picom".source = ../resources/dotfiles/picom;    
    ".config/rofi" = {
      source = ../resources/dotfiles/rofi;
      recursive = true;
    };

    # ----- LOCAL FILES ----------
    ".local/share/rofi/themes" = {
      source = ../resources/rofi-themes-collection/themes;
      recursive = true;
    };

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
