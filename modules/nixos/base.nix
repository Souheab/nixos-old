# base packages and options that I want on every system
{config, pkgs, ...}:
{
  environment.systemPackages = with pkgs; [
    git
    vim
    wget
    gcc
    cmake
    gnumake
    killall
  ]
}
