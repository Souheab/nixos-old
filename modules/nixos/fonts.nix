{ config, pkgs, ... }:
{
  fonts.packages = with pkgs; [
     jetbrains-mono
     lexend
     nerdfonts
     noto-fonts
     emacs-all-the-icons-fonts
  ];
}
