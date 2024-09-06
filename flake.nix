{
  description = "My nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nur.url = "github:nix-community/NUR";
    nixvim.url = "github:Souheab/nixvim";
  };

  outputs = { nixpkgs, nixpkgs-unstable, home-manager, nur, nixvim, ... }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {inherit system; config.allowUnfree = true;};
      pkgs-unstable = import nixpkgs-unstable {inherit system; config.allowUnfree = true;};
      mypkgs = import ./packages { inherit pkgs; inherit (pkgs) lib; };
      myshells = import ./shells { inherit pkgs; };
      nur-modules = import nur {
        nurpkgs = nixpkgs.legacyPackages.${system};
        pkgs = nixpkgs.legacyPackages.${system};
      };
      helpers = import ./modules/helpers.nix { inherit (pkgs) lib; };
    in
      {
        packages.${system} = mypkgs;
        nixosConfigurations = {
          nixo = nixpkgs.lib.nixosSystem {
            specialArgs = { inherit mypkgs; inherit myshells; inherit nur-modules; };
            modules = [
              ./nixo/configuration.nix
              home-manager.nixosModules.home-manager
              {
                home-manager.extraSpecialArgs = { inherit pkgs-unstable; inherit system; inherit nixvim; inherit helpers; };
                home-manager.useGlobalPkgs = true;
                home-manager.useUserPackages = true;
                home-manager.users.suller = import ./nixo/home.nix;
              }
              nur.nixosModules.nur
            ];
          };
        };
      };
}
