{
  imports = [
    ../../modules/virtualisation.nix
    ../../modules/i3wm.nix
    ../../users

    ./configuration.nix
    ./hardware-configuration.nix
    ./filesystem.nix
    ./boot.nix
  ];
}
