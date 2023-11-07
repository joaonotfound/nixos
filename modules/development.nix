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
    jdk20
    maven
    gradle
    nodejs_20
    yarn
    flutter
    git
    nsis
    dig
    nmap
    powershell
    remmina
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

}
