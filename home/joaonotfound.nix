{ config, pkgs, ... }@inputs: {
  imports = [
    ../modules/nitrogen.nix
    ../modules/development.nix
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
      name = "Awesthetic-dark";
      package = pkgs.solarc-gtk-theme;
    };
  };

  home.file = {
    # ---- CONFIG FILES ---------
    ".config/i3".source = ../resources/dotfiles/i3;
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

  home.sessionVariables = {
    EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
