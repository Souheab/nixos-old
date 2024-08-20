{
  description = "My nix config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager.url = "github:nix-community/home-manager/release-24.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, ... } @inputs:
    let
      pkg = import nixpkgs {
        config = {
          allowUnfree = true;
        };
      };
    in
    {
      nixosConfigurations = {
        myNixos = nixpkgs.lib.nixosSystem {
          modules = [
            ./nixos/configuration.nix
            home-manager.nixosModules.home-manager
            {
                home-manager.useGlobalPkgs = true;
                home-manager.useUserPackages = true;
            }
          ];
        };
      };
    };

}
