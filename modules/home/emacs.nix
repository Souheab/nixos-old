{ pkgs, ...}:
{
  imports = [
    ./lsp.nix
    ./latex.nix
    ./programming/go.nix
    ./programming/typescript.nix
  ];
  
  programs.emacs.enable = true;

  home.packages = with pkgs; [
    # For copilot mode
    nodejs
    pyright
    openjdk
    languagetool
  ];
}
