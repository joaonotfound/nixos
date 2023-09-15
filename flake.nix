{
  description = "My personal config";

  inputs = {
    nixpkgs = {
      url = "nixpkgs/nixos-23.05";
    };
    home-manager = {
      url = "github:nix-community/home-manager/release-23.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager }: let 
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      config = {
        allowUnfree = true;
      };
    };
    lib = nixpkgs.lib;
  in {
    homeManagerConfigurations = {
      joaonotfound = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.${system};

        modules = [
          ./home.nix
          {
            home = {
              username = "joaonotfound";
              homeDirectory = "/home/joaonotfound";
            };
          }
        ];
      };
    };

    nixosConfigurations = {
      joaonotfound = lib.nixosSystem {
        inherit system;

        modules = [
          ./configuration.nix
        ];
      };
    };
  };
}
