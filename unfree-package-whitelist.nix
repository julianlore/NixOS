{ lib, ... }:

{
  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) [
      "discord"
      "obsidian"
      "steam"
      "steam-run"
      # Jovian/Steam Deck
      "steam-jupiter-original"
      "steam-jupiter-unwrapped"
      "steamdeck-hw-theme"
    ];
}
