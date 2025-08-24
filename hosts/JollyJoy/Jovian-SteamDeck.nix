{ ... }:

{
  jovian.steamos.useSteamOSConfig = false;
  jovian.devices.steamdeck.enableSoundSupport = true;
  jovian.devices.steamdeck.enableControllerUdevRules = true;
  jovian.hardware.has.amd.gpu = true;

  # specialisation.gamingmode = import ./gaming-mode-specialization.nix;
}
