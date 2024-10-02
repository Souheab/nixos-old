{pkgs, ...}:
{
  home.packages = with pkgs; [
    ardour
    x42-plugins
  ];
}
