{ pkgs, ... }:

{
  imports =
    [
      ./symlinks.nix
    ];

  home.packages = with pkgs; [
    bitwarden
    syncthing
    cryptomator
    audacious
    signal-desktop
    bazecor
    libreoffice-qt6-fresh
    jellyfin-media-player
    # Nonfree
    obsidian
  ];
}
