{ pkgs, ... }:{
  home.packages = with pkgs; [
    vim
    neovim

		xclip
		xsel

    ripgrep /** Required to make livegrep plugin work */

		# Required for the Rust LSP to work on some projects
		gcc
  ];
}
