{ pkgs, ...}:
{
  imports = [
    ./lsp.nix
  ];
  
  programs.emacs.enable = true;

  home.packages = with pkgs; [
    # For copilot mode
    nodejs
  ];
}
