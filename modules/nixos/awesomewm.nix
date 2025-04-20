{pkgs, ...}:

{
  services.xserver.enable = true;
  services.xserver.windowManager.awesome.enable = true;

  environment.systemPackages = with pkgs; [
    pamixer
    xbacklight
  ];
}
