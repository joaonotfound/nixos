{
  imports = [
    ../../modules/virtualisation.nix
    ../../modules/de/gnome.nix
    ../../users

    ./configuration.nix
    ./hardware-configuration.nix
    ./filesystem.nix
    ./boot.nix
  ];
}
