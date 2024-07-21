{ pkgs, ... }: {
  home.packages = with pkgs; [
    /** Utilities */
    maven
    gradle

    wget
    gnumake    
    
    git
    gitAndTools.gitflow

    nsis
    dig
    hfsprogs

    unzip
    nmap
    
    remmina
    insomnia
    
    openssl

		devbox
		veracrypt
		restic
    gimp
    woeusb-ng

    gtk3
    
    traceroute
  
    nil # Nix Language Server Protocol
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
