{ arkenfox, ... }: {
  imports = [ arkenfox.hmModules.arkenfox ];

  programs.firefox = {
    arkenfox = {
      enable = true;
      version = "master";
    };

    profiles.Default.arkenfox = {
      enable = true;
      enableAllSections = true;
      # Resume previous session
      "0100"."0102"."browser.startup.page".value = 3;
      "2800"."2811"."privacy.clearOnShutdown_v2.historyFormDataAndDownloads".value =
        false;
    };
  };
}
