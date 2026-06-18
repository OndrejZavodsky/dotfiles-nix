{
	description = "nix v1";
	
	inputs = {
		nixpkgs.url = "nixpkgs/nixos-unstable";
		home-manager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs";
		};
		nixvim = {
    		url = "github:nix-community/nixvim";
			inputs.nixpkgs.follows = "nixpkgs";
  		};
	};

outputs = { self, nixpkgs, home-manager, nixvim,  ... }@inputs: 
	let
		system = "x86_64-linux";
		pkgs = nixpkgs.legacyPackages.${system};
	in {
		nixosConfigurations.onix = nixpkgs.lib.nixosSystem {
			inherit system;

			modules = [
				./configuration.nix
				home-manager.nixosModules.home-manager
				{
					home-manager = {
						useGlobalPkgs = true;
						useUserPackages = true;
						
						extraSpecialArgs = { inherit inputs; };

						users.ondrejz = import ./home.nix;
						backupFileExtension = "backup";
					};
				}
			];
		};

		devShells.${system} = {
			rust = import ./shells/rust.nix { inherit pkgs; };
			
			java = import ./shells/java.nix { inherit pkgs; };

			python = import ./shells/python.nix { inherit pkgs; };
		};
	};

}
