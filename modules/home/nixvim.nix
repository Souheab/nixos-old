{ config, pkgs, nixvim, ... }:
{
  imports = [ nixvim.homeManagerModules.nixvim ];

  programs.nixvim = {
    enable = true;
    plugins = {
      lualine = {
        enable = true;
      };
    };
  };
}
