{
  description = "Flake of joaonotfound";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/23.05";
    home-manager = {  
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    rust-overlay.url = "github:oxalica/rust-overlay";
  };

  outputs = { 
    self, 
    nixpkgs, 
    nixpkgs-stable, 
    home-manager,
    rust-overlay,
    ...
  }@inputs: let
      system = "x86_64-linux";
      env = (import ./env.nix) {};
      pkgs-stable = import nixpkgs-stable {
        inherit system;
        config.allowUnfree = true;
      };
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
        overlays = [
          (import rust-overlay)
        ];
      };
    in
    {
      nixosConfigurations.desktop = nixpkgs.lib.nixosSystem {        
        specialArgs = { 
          inherit inputs;
          system = env.system;
        };

        modules = [
          ./hosts/desktop
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = {
              inherit inputs;
              inherit pkgs;
              inherit pkgs-stable;
              inherit system;
              environment = env.users.desktop.environment;
            };
            home-manager.users = {
              joaonotfound = {
                imports = [ 
                  ./home/joaonotfound.nix
                ];
              };
            };            
          }
        ];
      };
    };
}
