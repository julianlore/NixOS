{ firefox-csshacks, ... }:
{
  home.file.".mozilla/firefox/Default/chrome/chrome".source = "${firefox-csshacks}/chrome";

  programs.firefox.profiles.Default.userChrome = ''
    @import url(chrome/hide_tabs_toolbar_v2.css);
  '';
}
