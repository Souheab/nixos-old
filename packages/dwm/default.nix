{ dwm 
, fetchFromGitHub
, feh
, sgbar
, kitty
, rofi
}:

dwm.overrideAttrs {
  src = fetchFromGitHub {
    owner = "Souheab";
    repo = "dwm";
    rev = "9bb96c5f776f751499d0936217cfa068766271da";
    sha256 = "sha256-pmsLWehNNDXYvex//SmltoLq+cX0LV+s7vAP0SX4pQ8=";
  };

  postPatch = ''
  substituteInPlace config.h \
    --replace 'feh' '${feh}/bin/feh' \
    --replace 'sgbar' '${sgbar}/bin/sgbar' \
    --replace 'wezterm' '${kitty}/bin/kitty' \
    --replace 'rofi' '${rofi}/bin/rofi'
  '';
  passthru.updateScript = null;
}
