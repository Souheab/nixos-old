{ dwm 
, fetchFromGitHub
, feh
, sgbar
, wezterm
}:

dwm.overrideAttrs {
  src = fetchFromGitHub {
    owner = "Souheab";
    repo = "dwm";
    rev = "747c1603dacd44037c3f72b04cf0edb8c6460525";
    sha256 = "sha256-ise7bQkK29MtEatltizu66W1yFhxllxmjxUrERK+r/I=";
  };

  postPatch = ''
  substituteInPlace config.h \
    --replace 'feh' '${feh}/bin/feh' \
    --replace 'sgbar' '${sgbar}/bin/sgbar' \
    --replace 'wezterm' '${wezterm}/bin/wezterm'
  '';
  passthru.updateScript = null;
}
