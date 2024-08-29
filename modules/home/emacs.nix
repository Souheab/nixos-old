{ config, pkgs, ...}:
{
  home.packages = with pkgs; [
    clang-tools
  ];

  programs.emacs.enable = true;
}
