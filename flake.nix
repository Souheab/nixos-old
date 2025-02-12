{
  description = "My nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.05";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nur.url = "github:nix-community/NUR";
    nixvim.url = "github:Souheab/nixvim";
  };

  outputs = { nixpkgs, nixpkgs-stable, home-manager, nur, nixvim, ... }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {inherit system; config.allowUnfree = true;};
      pkgs-stable = import nixpkgs-stable {inherit system; config.allowUnfree = true;};
      mypkgs = import ./packages { inherit pkgs; inherit (pkgs) lib; };
      myshells = import ./shells { inherit pkgs; inherit pkgs-stable; };
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
            specialArgs = { inherit mypkgs; inherit myshells; inherit nur-modules; inherit pkgs-stable; };
            modules = [
              ./nixo/configuration.nix
              home-manager.nixosModules.home-manager
              {
                home-manager.extraSpecialArgs = { inherit pkgs-stable; inherit system; inherit nixvim; inherit helpers; };
                home-manager.useGlobalPkgs = true;
                home-manager.useUserPackages = true;
                home-manager.users.suller = import ./nixo/home.nix;
              }
              nur.modules.nixos.default
            ];
          };
          legion = nixpkgs.lib.nixosSystem {
            specialArgs = { inherit mypkgs; inherit myshells; inherit nur-modules; inherit pkgs-stable; };
            modules = [
              ./legion/configuration.nix
            ];
          };
        };
      };
}
