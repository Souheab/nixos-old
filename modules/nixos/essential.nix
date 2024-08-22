# system packages and options that I would like to be present on any desktop linux system that I use
{config, pkgs, myshells, ...}:
{
  imports = [
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
  ];

  nix.settings.experimental-features = ["nix-command" "flakes"];

  environment.systemPackages = with pkgs; [
    emacs
    btop
    neovim
    ripgrep
    fastfetch
    neofetch
    pavucontrol
    tealdeer
    lazygit
    yt-dlp
  ];
}
