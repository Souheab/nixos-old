{pkgs, ...}:
{
  environment.systemPackages = with pkgs; [
    wineWowPackages.full
    winetricks
    bottles
  ];
}
