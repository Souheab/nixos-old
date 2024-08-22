{ dwm 
, fetchFromGitHub
}:

dwm.overrideAttrs {
  src = fetchFromGitHub {
    owner = "Souheab";
    repo = "dwm";
    rev = "747c160";
    sha256 = "sha256-G1J1360LMejNVeVwyHupKK3/bfrhWvW+3scU7EYVSt5=";
  };

  postPatch = null;
  passthru.updateScript = null;
}
