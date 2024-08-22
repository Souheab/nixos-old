# Useful tools for nix development
{config, pkgs, ...}:
{
  programs.nix-index.enable = true;
  programs.command-not-found.enable = false;

  environment.systemPackages = with pkgs; [
    nix-prefetch
    nix-prefetch-github
  ];
}
