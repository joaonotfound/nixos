{ pkgs, ... }: {
  home.packages = with pkgs; [ 
    fish
    zoxide
  ];

  programs.fish = {
    enable = true;
    shellInit = ''zoxide init fish | source'';
		shellAliases = {
			v = "nvim";
			vc = "veracrypt";
			c = "code";
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
