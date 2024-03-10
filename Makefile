
all:
	make system && make home
user:
	home-manager switch -f ./home/joaonotfound.nix
system:
	sudo nixos-rebuild switch -I nixos-config=./hosts/desktop
flake:
	sudo rm -rf ~/.config/nitrogen
	sudo nixos-rebuild switch --flake .?submodules=1#desktop
stow:
	pushd ./stow && stow --target="$HOME" */
backup:
	sh -c ./scripts/backup.sh