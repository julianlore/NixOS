{
  configuration = {
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
}
