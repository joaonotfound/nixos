
home:
	home-manager switch -f ./home.nix
system:
	sudo nixos-rebuild switch -I nixos-config=./configuration.nix
stow:
	pushd ./data && stow --target="$HOME" */
backup:
	./backup.sh