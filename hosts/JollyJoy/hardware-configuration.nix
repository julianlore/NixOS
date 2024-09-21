{ config, lib, modulesPath, ... }:

{
  imports = [ (modulesPath + "/installer/scan/not-detected.nix") ];

  boot.initrd.availableKernelModules =
    [ "nvme" "xhci_pci" "usb_storage" "usbhid" "sd_mod" "sdhci_pci" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-amd" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" = {
    device = "none";
    fsType = "tmpfs";
    options = [ "defaults" "size=25%" "mode=755" ];
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/878C-57E8";
    fsType = "vfat";
    options = [ "fmask=0077" "dmask=0077" ];
  };

  # LUKS device for /home/persistent
  boot.initrd.luks.devices."root" = {
    device = "/dev/disk/by-uuid/45a4663c-dd78-4661-8997-70d506ba5315";
    keyFileSize = 2048;
    keyFile = "/dev/sda";
    fallbackToPassword = true;
  };

  fileSystems."/persistent" = {
    device = "/dev/disk/by-uuid/e6429970-1bba-4266-a2b1-d6f97e675dd0";
    fsType = "btrfs";
    neededForBoot = true;
  };

  swapDevices =
    [{ device = "/dev/disk/by-uuid/bda2c370-23a3-4fc5-b5a4-42807bf0d72f"; }];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.wlo1.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode =
    lib.mkDefault config.hardware.enableRedistributableFirmware;
}
