{ pkgs, mypkgs, ...}:
{
  imports = [
    ./x11.nix
  ];

  services.xserver.windowManager.dwm.package = mypkgs.dwm;
  services.xserver.windowManager.dwm.enable = true;

  environment.systemPackages = with pkgs; [
    eww
  ];
}
