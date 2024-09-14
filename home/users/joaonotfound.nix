{ config, pkgs, pgks-22-11, environment, ... }: {
  imports = [
    ../modules/development  
    
    ../modules/fonts.nix
    ../modules/browser.nix
    
    /** Terminals */
    ../modules/terminal/${environment.terminal}.nix

    /** User shell */
    ../modules/shells/${environment.shell}.nix
    
    /** Bluetoth */
    (if (environment.bluetooth.enable) then ../modules/bluetooth.nix else {} )  
    
    /** Compositor */
    (if (environment.compositor.enable) then ../modules/compositor/${environment.compositor.package}.nix else {})
    
    /** Games launchers */
    (if (environment.gamesLaunchers) then ../modules/games.nix else {} )
    
    /** Trading and crypto */
    (if (environment.trading.enable) then ../modules/btc else {} )

		../modules/de

    ../../themes/gnome/${environment.gnome.theme}
    
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
    discord
    bitwarden
    peek    
    zip
    gzip
    stow
    anki
    openvpn
    killall
    ranger
    sshfs
    btop
    pgks-22-11.pcloud
    dbeaver-bin
    obs-studio
    obsidian
    direnv
    qbittorrent
    nixpkgs-fmt
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
    "wallpapers".source = ../../resources/wallpapers;    
    # Configuration file
    ".config/i3".source = ../../resources/dotfiles/i3;
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
    EDITOR = "nvim";
  };

  programs.home-manager.enable = true;
}
