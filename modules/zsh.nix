{ config, pkgs, ... }@inputs: {
  home.packages = with pkgs; [ 
    oh-my-zsh
    zsh
  ];

  programs.zsh = {  
    enable = true;
    shellAliases = {
      dl = "sudo docker logs -f --tail 100 $1";
      dst = "sudo docker start $1";
      dso = "sudo docker stop $1";
      dr = "sudo docker stop $1 && sudo docker start $1";
      p = "tilix --preferences";
    };
    ohMyZsh = {
      enable = true;
      plugins = [ "git" "sudo" "docker" "kubectl" ];
    };
    interactiveShellInit = ''
      export ZSH=${pkgs.oh-my-zsh}/share/oh-my-zsh/
      
      ZSH_THEME="agnoster"
      plugins=(git)

      source $ZSH/oh-my-zsh.sh
    '';
  };  
}