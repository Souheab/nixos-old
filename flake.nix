{
  description = "My nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/release-24.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, ... } @inputs:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {inherit system; config.allowUnfree = true;};
      mypkgs = import ./packages { inherit pkgs; inherit (pkgs) lib; };
      myshells = import ./shells { inherit pkgs; };
    in
      {
        packages.${system} = mypkgs;

        nixosConfigurations = {
          nixo = nixpkgs.lib.nixosSystem {
            specialArgs = { inherit mypkgs; inherit myshells; };
            modules = [
              ./nixo/configuration.nix
              home-manager.nixosModules.home-manager
              {
                home-manager.useGlobalPkgs = true;
                home-manager.useUserPackages = true;
                home-manager.users.suller = import ./nixo/home.nix;
              }
            ];
          };
        };
      };
}
