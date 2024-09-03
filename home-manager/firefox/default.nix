{
  imports = [ ./arkenfox.nix ./userchrome.nix ];
  programs.firefox = { enable = true; };
}
