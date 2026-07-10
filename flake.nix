{
  inputs = {
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, zen-browser, nixpkgs-unstable, home-manager, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system;
      config.allowUnfree = true; 
      };
      unstable = import nixpkgs-unstable { inherit system;     
      config.allowUnfree = true; };
      zen = import zen-browser { inherit system pkgs; };
      noctalia = inputs.noctalia.packages.${system}.default;
    in
    {
      nixosConfigurations.nano = nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit inputs pkgs system unstable noctalia zen;
        };
        modules = [
          ./configuration.nix
        ];
      };

      homeConfigurations."nano" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = { inherit self inputs ; };
        modules = [ ./home.nix ];
      };
    };
}
