{ arkenfox, ... }:
{
  imports = [ arkenfox.hmModules.arkenfox ];

  programs.firefox = {
    arkenfox = {
      enable = true;
      version = "master";
    };

    # See output of `nix build "github:dwarfmaster/arkenfox-nixos#arkenfox-vmaster-doc-static"` for options
    profiles.Default.arkenfox = {
      enable = true;
      enableAllSections = true;
      # Resume previous session
      "0100"."0102"."browser.startup.page".value = 3;
      "2800"."2812"."privacy.clearOnShutdown_v2.browsingHistoryAndDownloads".value = false;
    };
  };
}
