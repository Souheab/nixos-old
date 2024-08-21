{config, pkgs, ...}: {
  # Enable fwupd to update device firmware
  services.fwupd.enable = true;
}
