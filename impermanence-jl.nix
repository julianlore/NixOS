let
  prefixDir = prefix: dir: "${prefix}/${dir}";
  prefixFile = prefix: file: "${prefix}/${file}";
in
{
  environment.persistence."/persistent".users.jl = {
    # Prefer symlinking directories instead of default bindfs
    directories = [
      "Documents"
      "NixOS"
      "persistent"
      "wg"
    ]
    ++
      # Program folders
      [
        "Dygma"
        "qmk_firmware"
        ".mozilla"
        ".ssh"
        ".tmux"
        ".steam"
      ]
    ++
      # .config folders
      (builtins.map (prefixDir ".config") [
        "audacious"
        "Bazecor"
        "Bitwarden"
        "chromium"
        "dconf"
        "discord"
        "filezilla"
        "fish" # fish_variables
        "freerdp"
        "gtk-3.0"
        "gtk-4.0"
        "jellyfin-mpv-shim"
        "libreoffice"
        "obsidian"
        "qmk"
        "rclone"
        "Signal"
        "syncthing"
        "xsettingsd" # Theme, DPI, cursor, etc.
      ])
    ++ (builtins.map (prefixDir ".local/share") [
      "applications"
      "containers" # Podman
      "fish"
      "icons/hicolor"
      "kwalletd"
      "nvim"
      "Steam"
      "z"
    ])
    ++ (builtins.map (prefixDir ".local/state") [
      "nvim"
      "wireplumber"
    ]);
    files = [
      ".bash_history"
      ".gitconfig"
      ".gtkrc-2.0"
    ]
    ++ (builtins.map (prefixFile ".config") [
      "gtkrc"
      "gtkrc-2.0"
      "kwinoutputconfig.json" # Display configuration (which screens to use, resolution, etc.)
      "mimeapps.list" # Default programs
      "plasma-nm" # Whether airplane mode is on
      "Trolltech.conf" # Themes/color config
    ])
    ++ (builtins.map (prefixFile ".local/share") [
      "recently-used.xbel"
      "user-places.xbel"
    ])
    ++ (builtins.map (prefixFile ".local/state") [
      "lazygit/state.yml"
      "xdg-desktop-portal-kdestaterc"
    ]);
  };
}
