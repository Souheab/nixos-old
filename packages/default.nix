{ pkgs, lib }:
let
  sgbar = pkgs.callPackage ./sgbar { };
  callPackage = pkgs.callPackage;
in
{
  inherit sgbar;
  dwm = callPackage ./dwm { inherit sgbar; };
  # nordvpn-bin = callPackage ./nordvpn-bin { };
}
