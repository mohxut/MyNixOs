{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

outputs = { self, nixpkgs, home-manager , ... }: {
    nixosConfigurations.nano = nixpkgs.lib.nixosSystem {
	system = "x86_64-linux";
	modules = [
            ./configuration.nix
	    home-manager.nixosModules.default
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                users.mohx = ./home.nix;
		backupFileExtension = "backup" ;
            };
	}
      ];
    };
  };
}
