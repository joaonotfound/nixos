{ config, pkgs, pkgs-stable, ... }: {

  imports = [ 
    ./jdk_21.nix
  ];

  home.sessionPath = [ "${config.home.homeDirectory}/go/bin" ];
  
  home.packages = with pkgs; [
    pkgs-stable.flutter-unwrapped

    vim
    neovim
    wget
    emacs29
    jetbrains.idea-community
    android-studio
    vscode
    go
    gnumake
    opam
    maven
    gradle
    nodejs_20
    yarn
    git
    gitAndTools.gitflow
    nsis
    dig
    nmap
    python39
    python310Packages.pip
    remmina
    insomnia
    tor-browser-bundle-bin
    stripe-cli
    nodePackages_latest.localtunnel
    openssl
    gimp
    nodePackages.pnpm
    woeusb-ng
    
    (pkgs.rust-bin.stable.latest.default.override {
      extensions = [ "rust-src" "cargo" "rustc" "clippy" ];
    })
    rust-analyzer
    
    gcc
    nil # Nix Language Server Protocol
  ];

  home.sessionVariables = {
    RUST_SRC_PATH = "${pkgs.rust-bin.stable.latest.default.override {
      extensions = [ "rust-src" ];
    }}/lib/rustlib/src/rust/library";
  };

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
