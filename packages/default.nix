{ pkgs, lib }:
let
  sgbar = pkgs.callPackage ./sgbar { };
in
{
  inherit sgbar;
  dwm = pkgs.callPackage ./dwm { inherit sgbar; };
}
