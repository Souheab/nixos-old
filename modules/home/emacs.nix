{ pkgs, ...}:
{
  imports = [
    ./lsp.nix
    ./latex.nix
    ./programming
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
