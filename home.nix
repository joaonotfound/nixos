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
    minecraft
    zathura
    git
    jdk17 maven gradle
    nodejs_20 yarn
    flutter
    i3 polybar nitrogen rofi picom
    bitwarden
    go
    cargo rustc gcc
    gnumake
    zip gzip
    stow
    jetbrains-mono fira-code
    anki
    openvpn
    killall
    ranger
    sshfs
    flameshot
    lxappearance
    btop
    tilix
    dbeaver
    obs-studio
    obsidian
    virtualbox
    vagrant terraform
    direnv
    nsis
    qbittorrent
 ];

  programs.git = {
    enable = true;
    userName = "joaonotfound";
    userEmail = "joaonotfound@protonmail.com";

    aliases = {
      st = "status";
      co = "checkout";
      br = "branch";
      ci = "commit";
      df = "diff";
      lg = "log --graph --abbrev-commit --decorate --date=relative --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all";
      hist = "log --pretty=format:'%h %ad | %s%d [%an]' --graph --date=short";
      up = "!f() { git pull --rebase --autostash \"$@\"; }; f";
      out = "push origin HEAD";
      cob = "checkout -b";
      uncommit = "!f() { git reset HEAD~1 --soft; }; f";
      cleanup = "!f() { git branch --merged | grep -v '\\*' | xargs -n 1 git branch -d; }; f";
    };
  };
  

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
   ".config/i3".source = ./dotfiles/i3; 
   ".config/nitrogen/nitrogen.cfg".source = ./dotfiles/nitrogen/nitrogen.cfg;
   "wallpapers".source = ./wallpapers;
   ".config/picom".source = ./dotfiles/picom;
   ".config/polybar".source = ./dotfiles/polybar;
   ".config/alacritty".source = ./dotfiles/alacritty;
   ".config/rofi" = {
     source = ./dotfiles/rofi;
     recursive = true;
   };

  # ----- LOCAL FILES ----------
  ".local/share/rofi/themes" = {
     source = ./rofi-themes-collection/themes;
     recursive = true;
   };

 };

 home.sessionVariables = {
    EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
