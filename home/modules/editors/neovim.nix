{ pkgs, ... }:{
  home.packages = with pkgs; [
    vim
    neovim

		xclip
		xsel

    ripgrep /** Required to make livegrep plugin work */
  ];
}
