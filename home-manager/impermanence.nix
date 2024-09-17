{ impermanence, ... }:
let
  symlinkDir = dir: {
    directory = dir;
    method = "symlink";
  };
  prefixDir = prefix: dir: "${prefix}/${dir}";
  prefixFile = prefix: file: "${prefix}/${file}";
in {
  imports = [ impermanence.nixosModules.home-manager.impermanence ];
  home.persistence."/persistent/home/jl" = {
    # Prefer symlinking directories instead of default bindfs
    directories = builtins.map symlinkDir
      ([ "Documents" "NixOS" "persistent" "wg" ] ++
        # Program folders
        [ "Dygma" ".mozilla" ".ssh" ".tmux" ] ++
        # .config folders
        (builtins.map (prefixDir ".config") [
          "audacious"
          "Bazecor"
          "Bitwarden"
          "chromium"
          "filezilla"
          "fish" # fish_variables
          "gtk-3.0"
          "gtk-4.0"
          "jellyfin-mpv-shim"
          "kdedefaults"
          "libreoffice"
          "obsidian"
          "Signal"
          # "syncthing" # Currently in symlinks.nix
        ]) ++ (builtins.map (prefixDir ".local/share") [ "kwalletd" "nvim" ])
        ++ (builtins.map (prefixDir ".local/state") [ "nvim" "wireplumber" ]));
    files = [ ".bash_history" ".gitconfig" ".gtkrc-2.0" ]
      ++ (builtins.map (prefixFile ".config") [
        "kglobalshortcutsrc"
        "konsolerc"
        "kscreenlockerrc"
        "kwalletrc"
        "kwinrc" # Desktops, night color, tiling
        "kxkbrc" # Keyboard layout
        "mimeapp.list" # Default programs
        "plasma-nm" # Whether airplane mode is on
        "plasma-org.kde.plasma.desktop-appletsrc"
        "powerdevilrc" # Power saving options/timeouts
        "spectaclerc"
      ]) ++ (builtins.map (prefixFile ".local/share") [
        "fish/fish_history"
        "z/data"
        "recently-used.xbel"
        "user-places.xbel"
      ]) ++ (builtins.map (prefixFile ".local/state") [
        "lazygit/state.yml"
        "plasmashellstaterc"
        "systemsettingsstaterc"
        "xdg-desktop-portal-kdestaterc"
      ]);
  };
}
