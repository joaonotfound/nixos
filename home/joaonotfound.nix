{ config, pkgs, environment, ... }: {
  imports = [
    ../modules/nitrogen.nix
    ../modules/development  
    
    ../modules/fonts.nix
    ../modules/browser.nix
    
    /** Terminals */
    ../modules/terminal/${environment.terminal}.nix

    /** User shell */
    ../modules/shells/${environment.shell}.nix
    
    /** Bluetoth */
    (if (environment.bluetooth.enable) then ../modules/bluetooth.nix else {} )
    
    /** Maybe implement a better way to detect whether thre's a app launcher or not? */
    (if (environment.de != "gnome") then ../modules/launchers/${environment.twm.appLauncher}.nix else {} )

    /** Desktop bars */
    (if (environment.de != "gnome") then ../modules/bar/${environment.twm.desktopBar}.nix else {} )
    
    /** Games launchers */
    (if (environment.gamesLaunchers) then ../modules/games.nix else {} )

    ../themes/gnome/${environment.gnome.theme}
    
    ../modules/reading/zathura.nix
    ../modules/audio/rhythmbox.nix
    ../modules/images/shotwell.nix
  ]
  /** Editors */
  ++ (map (editor: ../modules/editors/${editor}.nix) environment.editors)

  /** Programming languages */
  ++ (map (sdk: ../modules/development/${sdk}.nix) environment.SDKs);
  
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
