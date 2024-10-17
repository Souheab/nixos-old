{ pkgs, ...}:
{
  home.packages = with pkgs; [
    gotools 
  ];
}
