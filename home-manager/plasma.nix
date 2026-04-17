{ plasma-manager, ... }:
{
  imports = [ plasma-manager.homeModules.plasma-manager ];
  programs.plasma = {
    enable = true;
    input.keyboard.layouts = [
      {
        layout = "ca";
        variant = "multix";
      }
    ];
    kscreenlocker = {
      autoLock = false;
      lockOnResume = false;
    };
    kwin.nightLight.enable = true;
    panels = [
      {
        widgets = [
          "org.kde.plasma.kickoff"
          {
            iconTasks = {
              launchers = [
                "preferred://browser"
                "applications:org.kde.konsole.desktop"
                "applications:obsidian.desktop"
                "applications:discord.desktop"
                "applications:bitwarden.desktop"
                "applications:steam.desktop"
              ];
            };
          }
          "org.kde.plasma.marginsseparator"
          "org.kde.plasma.systemtray"
          {
            digitalClock = {
              time.showSeconds = "always";
            };
          }
        ];
      }
    ];
    powerdevil = {
      AC = {
        autoSuspend.action = "nothing";
        dimDisplay = {
          enable = true;
          idleTimeout = 120;
        };
        powerButtonAction = "turnOffScreen";
        turnOffDisplay.idleTimeout = 300;
      };
      battery = {
        autoSuspend.action = "nothing";
        dimDisplay = {
          enable = true;
          idleTimeout = 60;
        };
        powerButtonAction = "sleep";
        turnOffDisplay.idleTimeout = 120;
      };
    };
    session.sessionRestore.restoreOpenApplicationsOnLogin = "startWithEmptySession";
    shortcuts = {
      "kcm_touchpad"."Enable Touchpad" = [ ]; # Overwrite Touchpad as to not conflict with mic_mute
      "kmix"."mic_mute" = "Touchpad On"; # Touchpad On = F22
      "kwin"."Show Desktop" = "Meta+D";
      "kwin"."Walk Through Windows" = "Alt+Tab";
      "kwin"."Walk Through Windows (Reverse)" = "Alt+Shift+Tab";
      "kwin"."Window Close" = "Alt+F4";
      "kwin"."Window Maximize" = "Meta+Up";
      "kwin"."Window Minimize" = "Meta+Down";
      "kwin"."Window One Desktop Down" = "Meta+Ctrl+Shift+Down";
      "kwin"."Window One Desktop Up" = "Meta+Ctrl+Shift+Up";
      "kwin"."Window One Desktop to the Left" = "Meta+Ctrl+Shift+Left";
      "kwin"."Window One Desktop to the Right" = "Meta+Ctrl+Shift+Right";
      "kwin"."Window Quick Tile Bottom" = "Meta+Down";
      "kwin"."Window Quick Tile Left" = "Meta+Left";
      "kwin"."Window Quick Tile Right" = "Meta+Right";
      "kwin"."Window Quick Tile Top" = "Meta+Up";
      "kwin"."Window to Next Screen" = "Meta+Shift+Right";
      "kwin"."Window to Previous Screen" = "Meta+Shift+Left";
      "org_kde_powerdevil"."Turn Off Screen" = "Launch (5)"; # Launch (5) = F14
      "plasmashell"."activate task manager entry 1" = [
        "Meta+1"
        "Meta+B"
      ];
      "plasmashell"."activate task manager entry 2" = [
        "Meta+2"
        "Meta+C"
      ];
      "plasmashell"."activate task manager entry 3" = [
        "Meta+3"
        "Meta+X"
      ];
      "plasmashell"."activate task manager entry 4" = "Meta+4";
      "plasmashell"."activate task manager entry 5" = "Meta+5";
      "plasmashell"."activate task manager entry 6" = "Meta+6";
      "plasmashell"."activate task manager entry 7" = "Meta+7";
      "plasmashell"."activate task manager entry 8" = "Meta+8";
      "plasmashell"."activate task manager entry 9" = "Meta+9";
      "plasmashell"."activate task manager entry 10" = "Meta+0";
      "plasmashell"."show-on-mouse-pos" = "Meta+V";
    };
    workspace = {
      colorScheme = "BreezeDark";
      lookAndFeel = "org.kde.breezedark.desktop";
      theme = "breeze-dark";
    };
    configFile = {
      "baloofilerc"."Basic Settings"."Indexing-Enabled" = false; # Disable file indexing as it takes up a lot of space and will be redone on boot if not persisted
      "kded5rc"."Module-browserintegrationreminder"."autoload" = false;
      "kded5rc"."Module-device_automounter"."autoload" = false;
      "kwalletrc"."Wallet"."First Use" = false;
      "kwinrc"."Windows"."Placement" = "Maximizing";
      "plasma-localerc"."Formats"."LANG" = "en_US.UTF-8";
    };
  };
}
