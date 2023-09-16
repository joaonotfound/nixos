
all:
	make system && make home
home:
	home-manager switch -f ./home.nix
system:
	sudo nixos-rebuild switch -I nixos-config=./configuration.nix
stow:
	pushd ./stow && stow --target="$HOME" */
backup:
	./backup.sh