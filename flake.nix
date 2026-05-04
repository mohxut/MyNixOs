{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    flake-parts.url = "github:hercules-ci/flake-parts";
    import-tree.url = "github:vic/import-tree";

    wrapper-modules.url = "github:BirdeeHub/nix-wrapper-modules";
  };

outputs = { self, nixpkgs, ... } @ inputs: {
    nixosConfigurations.nano = nixpkgs.lib.nixosSystem {
	system = "x86_64-linux";
	specialArgs = { inherit inputs; };
      modules = [
        ./configuration.nix
      ];
    };
  };
}
