{
    description = "Home Manager configuration of Grant";

    inputs = {
      nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
      home-manager = {
        url = "github:nix-community/home-manager";
        inputs.nixpkgs.follows = "nixpkgs";
      };
      nix-index-database.url = "github:Mic92/nix-index-database";
      nix-index-database.inputs.nixpkgs.follows = "nixpkgs";
      nix-colors.url = "github:misterio77/nix-colors";
    };

    outputs = { nixpkgs, home-manager, nix-index-database, ... }@inputs:
      let
        system = "x86_64-linux";
        pkgs = nixpkgs.legacyPackages.${system};
      in {
        homeConfigurations = {
	        home = home-manager.lib.homeManagerConfiguration {
            inherit pkgs;
		        extraSpecialArgs = { inherit inputs; };
            modules = [ 
              ./profiles/home.nix 
              nix-index-database.hmModules.nix-index
            ];
          };

          homewm = home-manager.lib.homeManagerConfiguration {
            inherit pkgs;
		        extraSpecialArgs = { inherit inputs; };
            modules = [ 
              ./profiles/homewm.nix 
              nix-index-database.hmModules.nix-index
            ];
          };
        };
      };
}
