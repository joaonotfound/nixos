{ pkgs, environment,... }: {
  home.packages = with pkgs; [ 
    fish
    zoxide
      ] ++ (if environment.neofetch.enable then [ neofetch ] else []);

	home.file = {
		/* Neofetch config	 */	
		".config/neofetch".source = ../../../resources/dotfiles/neofetch;
	};

  programs.fish = {
    enable = true;
    shellInit = ''
		zoxide init fish | source
    ${if environment.neofetch.enable then "neofetch" else ""}
		'';
		shellAliases = {
			v = "nvim";
			vc = "veracrypt -t";
			c = "code";
			cl = "clear";
			l = "ls -lha";
			p = ''fish -P --init-command "function fish_prompt
        set_color green
        echo -n (whoami)@\'\'
        set_color white
        echo -n (hostname | cut -d . -f 1) ' '
        set_color red
        echo  -n \(private\) \'\'
        set_color green
        echo -n (prompt_pwd) ' '
        set_color normal
      end"'';
		};
  };
}
