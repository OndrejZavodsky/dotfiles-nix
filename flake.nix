{
	description = "nix v1";
	
	inputs = {
		nixpkgs.url = "nixpkgs/nixos-unstable";
		home-manager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs";
		};
	};

	outputs = { nixpkgs, home-manager, ... }:
	let
		system = "x86_64-linux";
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
