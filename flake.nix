{
    description = "Home Manager configuration of Grant";

    inputs = {
      nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
      home-manager = {
        url = "github:nix-community/home-manager";
        inputs.nixpkgs.follows = "nixpkgs";
      };
      stylix.url = "github:danth/stylix";
    };

    outputs = { nixpkgs, home-manager, stylix, ... }@inputs:
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
              stylix.homeManagerModules.stylix
            ];
          };

          wmhome = home-manager.lib.homeManagerConfiguration {
            inherit pkgs;
		        extraSpecialArgs = { inherit inputs; };
            modules = [ 
              ./profiles/wmhome.nix
              stylix.homeManagerModules.stylix
            ];
          };
        };
      };
}
