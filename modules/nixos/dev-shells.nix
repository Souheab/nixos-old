{ config, pkgs, myshells, ... }:
let
  nix-shell-path = "${pkgs.nix}/bin/nix-shell";
in
{
  environment.shellAliases = {
    cdevsh = "${nix-shell-path} ${myshells.c-dev.drvPath}";
  };
}
