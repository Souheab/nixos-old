{ pkgs, lib }:

{
  sgbar = pkgs.callPackage ./sgbar { };
  dwm = pkgs.callPackage ./dwm { };
}
