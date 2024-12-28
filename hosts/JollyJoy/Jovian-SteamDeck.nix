{ ... }:

{
  jovian.steamos.useSteamOSConfig = false;
  jovian.devices.steamdeck.enableSoundSupport = true;
  jovian.devices.steamdeck.enableControllerUdevRules = true;
  jovian.hardware.has.amd.gpu = true;

  specialisation.gamingmode = {
    configuration = {
      jovian.decky-loader = {
        enable = true;
        user = "jl";
      };

      jovian.devices.steamdeck = {
        enable = true;
        enableKernelPatches = false;
        # OS fan service fails to start
        enableOsFanControl = false;
      };

      jovian.steam = {
        autoStart = true;
        enable = true;
        user = "jl";
        desktopSession = "plasma";
      };
    };
  };
}
