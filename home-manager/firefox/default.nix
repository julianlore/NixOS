{ config, ... }:

{
  imports = [
    ./arkenfox.nix
    ./userchrome.nix
  ];
  programs.firefox = {
    enable = true;
    # Do not install firefox for user, as it will overwrite the firejail wrapper
    package = null;
    configPath = "${config.xdg.configHome}/mozilla/firefox";
  };
}
