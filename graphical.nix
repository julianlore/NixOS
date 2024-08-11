{ pkgs, ... }:

{
  services.xserver.enable = true;
  services.desktopManager.plasma6.enable = true;
  services.displayManager.defaultSession = "plasma";
  services.displayManager.autoLogin.enable = true;
  services.displayManager.autoLogin.user = "jl";

  hardware.bluetooth.enable = true;

  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  environment.systemPackages = with pkgs; [
    firefox
    chromium
  ];

  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [
      "Iosevka"
    ];})
  ];
}
