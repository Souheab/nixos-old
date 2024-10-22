{ pkgs, pkgs-stable }:
{
  c-dev = import ./c-dev { inherit pkgs; inherit pkgs-stable;};
}
  
