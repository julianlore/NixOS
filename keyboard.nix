{ pkgs, ... }: {
  hardware.keyboard.qmk.enable = true;
  environment.systemPackages = with pkgs; [ bazecor qmk vial ];
  services.udev.packages = with pkgs; [ bazecor vial ];
}
