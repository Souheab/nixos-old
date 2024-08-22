# A maximalist shell for C programming
{ pkgs }:

pkgs.mkShell {
  buildInputs = with pkgs; [
    gcc
    gdb
    gnumake
    cmake
    gtk3
    glib
    xorg
    libX11
    libXinerma
    libXft
    libpulseaudio
    networkmanager
  ]
}
