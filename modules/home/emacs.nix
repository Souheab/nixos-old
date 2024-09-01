{ config, pkgs, ...}:
{
  imports = [
    ./lsp.nix
  ];
  
  programs.emacs.enable = true;
}
