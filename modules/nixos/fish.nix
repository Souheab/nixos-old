{ config, pkgs, ... }:
{
  programs.fish.enable = true;
  users.users.suller.shell = pkgs.fish;
}
