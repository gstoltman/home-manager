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
      nixpkgs.url = "nixpkgs/nixos-unstable";
      quickshell = {
      # add ?ref=<tag> to track a tag
        url = "git+https://git.outfoxxed.me/outfoxxed/quickshell";
        inputs.nixpkgs.follows = "nixpkgs";
      };
    };

    outputs = { nixpkgs, home-manager, nixvim, stylix, quickshell, ... }@inputs:
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
              # Might need to address quickshell
            ];
          };
        };
      };
}
