let
  prefixDir = prefix: dir: "${prefix}/${dir}";
  prefixFile = prefix: file: "${prefix}/${file}";
in {
  environment.persistence."/home/persistent".users.jl = {
    # Prefer symlinking directories instead of default bindfs
    directories = [ "Documents" "NixOS" "persistent" "wg" ] ++
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
        "syncthing"
        # "syncthing" # Currently in symlinks.nix
      ]) ++ (builtins.map (prefixDir ".local/share") [
        "fish"
        "kwalletd"
        "nvim"
        "z"
      ]) ++ (builtins.map (prefixDir ".local/state") [ "nvim" "wireplumber" ]);
    files = [ ".bash_history" ".gitconfig" ".gtkrc-2.0" ]
      ++ (builtins.map (prefixFile ".config") [
        "gtkrc"
        "gtkrc-2.0"
        "kglobalshortcutsrc"
        "konsolerc"
        "kscreenlockerrc"
        "kwalletrc"
        "kwinrc" # Desktops, night color, tiling
        "kxkbrc" # Keyboard layout
        "mimeapp.list" # Default programs
        "plasma-nm" # Whether airplane mode is on
        "plasma-org.kde.plasma.desktop-appletsrc"
        "plasmashellrc"
        "powerdevilrc" # Power saving options/timeouts
        "spectaclerc"
        "Trolltech.conf" # Themes/color config
      ]) ++ (builtins.map (prefixFile ".local/share") [
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
