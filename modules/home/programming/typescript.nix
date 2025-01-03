{ pkgs, ...}:
{
  home.packages = with pkgs; [
    typescript
    nodePackages_latest.typescript-language-server
  ];
}
