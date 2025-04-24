# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ ... }:
{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      # essential packages and options
      ../modules/nixos/essential.nix
      # Gaming related options
      ../modules/nixos/gaming.nix
      # KDE
      ../modules/nixos/kde.nix
      # DWM
      ../modules/nixos/dwm.nix
      # Hyprland
      ../modules/nixos/hyprland.nix
      # Fish shell
      ../modules/nixos/fish.nix
      # Fingerprint sensor
      ../modules/nixos/fprintd.nix
      # Enable wireshark
      ../modules/nixos/wireshark.nix
      # Windows compatibility
      ../modules/nixos/windows-compatibility.nix
    ];

  networking.hostName = "nixo";

  # Set your time zone.
  time.timeZone = "Asia/Riyadh";
  # Select internationalisation properties.
  i18n.defaultLocale = "en_CA.UTF-8";

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.suller = {
    isNormalUser = true;
    description = "suller";
    extraGroups = [ "networkmanager" "wheel" "docker"];
    initialPassword = "password";
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Docker
  virtualisation.docker.enable = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?
}
