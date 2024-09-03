{ nixvim, ... }:
{
  imports = [
    nixvim.homeManagerModules.nixvim
    ./opts.nix
    ./colorscheme.nix
    ./keymaps
    ./plugins
  ];

  programs.nixvim = {
    enable = true;
  };
}
