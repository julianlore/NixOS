{ lib, ... }:

{
  nixpkgs.config.allowUnfreePredicate =
    pkg:
    builtins.elem (lib.getName pkg) [
      "claude-code"
      "discord"
      "discord-unwrapped"
      "obsidian"
      "steam"
      "steam-unwrapped"
      "steam-run"
      # Jovian/Steam Deck
      "steam-jupiter-original"
      "steam-jupiter-unwrapped"
      "steamdeck-hw-theme"
    ];
}
