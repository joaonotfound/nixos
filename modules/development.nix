{ config, pkgs, ... }@inputs: {
  home.packages = with pkgs; [
    vim
    emacs29
    jetbrains.idea-community
    android-studio
    vscode
    go
    cargo
    rustc
    gcc
    gnumake
    opam
    maven
    gradle
    nodejs_20
    yarn
    flutter
    git
    gitAndTools.gitflow
    nsis
    dig
    nmap
    python39
    python310Packages.pip
    powershell
    remmina
    insomnia
    tor-browser-bundle-bin
    bisq-desktop
    stripe-cli
    nodePackages_latest.localtunnel
    openssl
    gimp
    google-chrome
    nodePackages.pnpm
    jdk21
    woeusb-ng
  ];

  programs.git = {
    enable = true;
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

}
