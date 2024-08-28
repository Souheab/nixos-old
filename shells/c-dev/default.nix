# A maximalist shell for C programming
{ pkgs }:

pkgs.mkShell {
  packages = with pkgs; [
    pkg-config
    bear
    gcc
    gdb
    gnumake
    cmake
    gtk3
    gtk4
    glib
    xorg.libX11
    xorg.libXinerama
    xorg.libXft
    xorg.xorgserver
    libpulseaudio
    networkmanager
  ];
}
