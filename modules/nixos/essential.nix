# system packages and options that I would like to be present on any desktop linux system that I use
{config, pkgs, myshells, ...}:
{
  imports = [
    ./options.nix
    ./base.nix
    ./audio.nix
    ./networkmanager.nix
    ./printing.nix
    ./systemd-boot.nix
    ./x11.nix
    ./linux-zen.nix
    ./fwupd.nix
    ./fonts.nix
    ./firefox.nix
    ./nix-tools.nix
    ./dev-shells.nix
    ./fprintd.nix
    ./nordvpn.nix
  ];

  nix.settings.experimental-features = ["nix-command" "flakes"];
  
  # Enable flatpak
  services.flatpak.enable = true;

  # Enable bluetooth
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;

  environment.systemPackages = with pkgs; [
    btop
    vim
    ripgrep
    fastfetch
    neofetch
    pwvucontrol
    tealdeer
    lazygit
    usbutils
    python3
    android-tools
    distrobox
    verilog
    ffmpeg
    file
    wirelesstools
    glib
  ];
}
