{ pkgs, ...}:
{
  home.packages = with pkgs; [
    gotools
    gopls
    delve
  ];
}
