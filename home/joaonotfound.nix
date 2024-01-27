{ config, pkgs, ... }@inputs: {
  imports = [
    ../modules/nitrogen.nix
    ../modules/development.nix
    ../modules/themes/colloid-papirus.nix
  ];
  home.username = "joaonotfound";
  home.homeDirectory = "/home/joaonotfound";

  home.stateVersion = "23.05";

  home.sessionPath = [ "${config.home.homeDirectory}/go/bin" ];

  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })
    alacritty
    spotify
    pavucontrol
    discord
    brave
    steam
    lutris
    minecraft
    zathura
    i3
    polybar
    rofi
    picom
    bitwarden
    zip
    gzip
    stow
    jetbrains-mono
    fira-code
    anki
    openvpn
    killall
    ranger
    sshfs
    flameshot
    peek
    lxappearance
    btop
    tilix
    dbeaver
    obs-studio
    obsidian
    vagrant
    terraform
    direnv
    qbittorrent
    nixpkgs-fmt
    electrum
    firefox
    onlyoffice-bin
    libsForQt5.okular
  ];

  # Activate fonts like Jetbrains 
  fonts.fontconfig.enable = true;

  # Set GTK's dark mode
  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
  };

  home.file = {
    # ---- CONFIG FILES ---------
    ".config/i3".source = ../resources/dotfiles/i3;
    ".config/i3status".source = ../resources/dotfiles/i3status;
    "wallpapers".source = ../resources/wallpapers;
    ".config/picom".source = ../resources/dotfiles/picom;
    ".config/polybar".source = ../resources/dotfiles/polybar;
    ".config/alacritty".source = ../resources/dotfiles/alacritty;
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
