{ lib
, stdenv
, fetchFromGitHub
, pkg-config
, gtk3
, glib
, xorg
, libpulseaudio
, networkmanager
}:

stdenv.mkDerivation {
  pname = "sgbar";
  version = "0.1";

  src = fetchFromGitHub {
    owner = "Souheab";
    repo = "sgbar";
    rev = "2616675";
    sha256 = "sha256-G1J1360LMejNVeVwyHupKK3/bfrhWvW+3scU7EYVSt4=";
  };

  nativeBuildInputs = [
    pkg-config
  ];

  buildInputs = [
    gtk3
    glib
    xorg.libX11
    libpulseaudio
    networkmanager
  ];

  patchPhase = ''
    substituteInPlace config.h \
      --replace '/usr/local/share/sgbar/style.css' '${placeholder "out"}/share/sgbar/style.css'
  '';

  buildPhase = ''
    make
  '';

  installPhase = ''
    runHook preInstall
    mkdir -p $out/bin
    cp -f sgbar $out/bin
    chmod 755 $out/bin/sgbar
    mkdir -p $out/share/sgbar
    cp -f style.css $out/share/sgbar
    runHook postInstall
  '';

  meta = with lib; {
    description = "A simple desktop bar dock program";
    homepage = "https://github.com/Souheab/sgbar";
    platforms = platforms.linux;
  };
}
