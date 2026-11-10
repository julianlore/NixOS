{ pkgs, ... }:

{
  services.xserver.enable = true;
  services.desktopManager.plasma6.enable = true;
  services.displayManager.defaultSession = "plasma";
  services.displayManager.autoLogin.enable = true;
  services.displayManager.autoLogin.user = "jl";

  # Blank and power off the screen after 1 minute while the LightDM greeter is shown
  # (for example after KRDP logs out the host session). These render into the
  # ServerFlags section of the generated xorg.conf, which applies to the
  # greeter's X server; the Plasma session manages its own screen power
  # settings after login.
  services.xserver.serverFlagsSection = ''
    Option "BlankTime" "1"
    Option "StandbyTime" "0"
    Option "SuspendTime" "0"
    Option "OffTime" "1"
  '';

  hardware.bluetooth.enable = true;

  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  environment.systemPackages = with pkgs; [
    firefox
    chromium
  ];

  fonts.packages = with pkgs; [ nerd-fonts.iosevka ];
}
