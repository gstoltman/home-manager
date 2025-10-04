{
    description = "Home Manager configuration of Grant";

    inputs = {
      nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
      home-manager = {
        url = "github:nix-community/home-manager";
        inputs.nixpkgs.follows = "nixpkgs";
      };
      stylix.url = "github:danth/stylix";
      nixvim ={
        url = "github:nix-community/nixvim";
        inputs.nixpkgs.follows = "nixpkgs";
      };
    };

    outputs = { nixpkgs, home-manager, nixvim, stylix, ... }@inputs:
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
              nixvim.homeManagerModules.nixvim
              stylix.homeModules.stylix
            ];
          };
        };
      };
}
