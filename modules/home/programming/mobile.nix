{ pkgs, ...}:
{
  home.packages = with pkgs; [
    nodePackages.eas-cli
  ];
}
