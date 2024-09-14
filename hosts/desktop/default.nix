{ configuration } : {
  imports = [
    ../modules/virtualisation.nix

    /** Desktop environment */
    ../modules/de/${configuration.de}.nix

    ../../users

    ./configuration.nix
    ./hardware-configuration.nix
    ./filesystem.nix
    ./boot.nix
  ];
}
