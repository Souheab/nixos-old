{ config, pkgs, ...}:
{
  programs.mpv.enable = true;
  
  programs.mpv.bindings = {
    k = "add volume 10";
    j = "add volume -10";
    UP = "add volume 10";
    DOWN = "add volume -10";
    "Ctrl+k" = "add volume 1";
    "Ctrl+j" = "add volume -1";
    WHEEL_UP = "add volume 2";
    WHEEL_DOWN = "add volume -2";
    h = "seek -2";
    l = "seek 2";
    "Ctrl+h" = "seek -60";
    "Ctrl+l" = "seek 60";
    "Alt+l" = "ab-loop";
    "Ctrl+Alt+l" = "cycle-values loop-file \"inf\" \"no\"";
    "Shift+h" = "add chapter -1";
    "Shift+l" = "add chapter 1";
    "Shift+g" = "add sub-scale +0.01";
    "Shift+f" = "add sub-scale -0.01";
    "-" = "multiply speed 1/1.1";
    "=" = "multiply speed 1.1";
    v = "cycle sub";
    V = "cycle sub down";
    b = "cycle audio";
    B = "cycle audio down";
  };

  programs.mpv.config = {
    alang = "jpn";
    slang = "jpn,eng";
    osd-font = "Lexend Deca";
    osd-font-size = 70;
    screenshot-directory = "~/Pictures/mpv-screenshots";
    screenshot-template = "mpv-shot-%F-%P";
    screenshot-format = "png";
    keep-open = "yes";
    save-position-on-quit = "yes";
    profile = "gpu-hq";
  };
}
