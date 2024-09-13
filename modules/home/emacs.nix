{ pkgs, ...}:
{
  imports = [
    ./lsp.nix
    ./latex.nix
  ];
  
  programs.emacs.enable = true;

  home.packages = with pkgs; [
    # For copilot mode
    nodejs
  ];
}
