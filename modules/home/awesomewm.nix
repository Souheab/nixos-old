{pkgs, ...}:
{
  imports = [
    ./rofi.nix
  ];

  home.file.".xprofile".text = ''
    #!/bin/sh

    ${pkgs.picom}/bin/picom &
  '';
}
