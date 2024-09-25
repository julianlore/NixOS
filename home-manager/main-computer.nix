{ config, pkgs, ... }:

{
  imports = [ ./firefox ./plasma.nix ];

  home.packages = with pkgs; [
    bitwarden
    syncthing
    cryptomator
    audacious
    signal-desktop
    bazecor
    libreoffice-qt6-fresh
    (jellyfin-mpv-shim.overridePythonAttrs (prev: {
      # Add pypresence as a dependency to support Discord Rich Presence
      propagatedBuildInputs = prev.propagatedBuildInputs
        ++ [ pkgs.python3Packages.pypresence ];
    }))
    # Nonfree
    obsidian
  ];

  home.file.".config/autostart/discord.desktop".source =
    config.lib.file.mkOutOfStoreSymlink
    "/run/current-system/sw/share/applications/discord.desktop";
  home.file.".config/autostart/firefox.desktop".source =
    config.lib.file.mkOutOfStoreSymlink
    "/run/current-system/sw/share/applications/firefox.desktop";
  home.file.".config/autostart/obsidian.desktop".source =
    config.lib.file.mkOutOfStoreSymlink
    "/home/jl/.nix-profile/share/applications/obsidian.desktop";
  home.file.".config/autostart/signal-desktop.desktop".source =
    config.lib.file.mkOutOfStoreSymlink
    "/home/jl/.nix-profile/share/applications/signal-desktop.desktop";
  home.file.".config/autostart/konsole-tmux.desktop".text = ''
    [Desktop Entry]
    Exec=konsole -e tmux attach-session
    Icon=application-x-shellscript
    Name=konsole-tmux
    Type=Application
    X-KDE-AutostartScript=true
  '';

  services.syncthing.enable = true;
}
