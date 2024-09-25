{ lib, ... }:

{
  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) [
      "discord"
      "obsidian"
      "steam-run"
      "steam-jupiter-original"
    ];
}
