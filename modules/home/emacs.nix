{ pkgs, ...}:
{
  imports = [
    ./lsp.nix
    ./latex.nix
    ./programming/go.nix
  ];
  
  programs.emacs.enable = true;

  home.packages = with pkgs; [
    # For copilot mode
    nodejs
    python312Packages.python-lsp-server
  ];
}
