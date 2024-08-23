{config, pkgs, mypkgs, ...}:
{
  services.xserver.windowManager.dwm.package = mypkgs.dwm;
  services.xserver.windowManager.dwm.enable = true;
}
