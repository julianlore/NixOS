{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [ bazecor ];
  services.udev.packages = with pkgs; [ bazecor ];
}
