{
  description = "brief package description";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    rust-overlay.url = "github:oxalica/rust-overlay";
  };

  outputs = { 
    self, 
    nixpkgs, 
    home-manager,
    rust-overlay,
    ...
  }@inputs: let
      system = "x86_64-linux";
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
        specialArgs = { inherit inputs; };

        modules = [
          ./hosts/desktop
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = {
              inherit inputs;
              inherit pkgs;
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
