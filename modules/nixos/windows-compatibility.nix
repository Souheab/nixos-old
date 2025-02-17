{pkgs, ...}:
{
  environment.systemPackages = with pkgs; [
    wineWowPackages.full
    bottles
  ];
}
