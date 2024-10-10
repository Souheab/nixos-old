{pkgs, ...}:
{
  users.groups = {
    wireshark = {};
  };
  
  programs.wireshark = {
    enable = true;
    package  = pkgs.wireshark;
  };

  users.users.suller = {
    extraGroups = [ "wireshark" ];
  };
}
