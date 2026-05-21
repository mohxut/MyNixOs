{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    niri = {
      url = "github:sodiboo/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    noctalia.url = "github:noctalia-dev/noctalia-shell";

  };

outputs = { self, nixpkgs, home-manager , ... }@inputs: {
    nixosConfigurations.nano = nixpkgs.lib.nixosSystem {
	system = "x86_64-linux";

	specialArgs = { inherit inputs; };
	modules = [
            ./configuration.nix
	    home-manager.nixosModules.default
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
		extraSpecialArgs = { inherit inputs; };
                users.mohx = ./home.nix;
		backupFileExtension = "backup" ;
            };
	}
      ];
    };

    homeConfigurations."mohx" = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.x86_64-linux;
      extraSpecialArgs = { inherit inputs; };
      modules = [ ./home.nix ];
    };
  };
}
