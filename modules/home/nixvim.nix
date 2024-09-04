{ nixvim, system, ... }:
{
  home.packages = [
    nixvim.packages.${system}.default
  ];
}
