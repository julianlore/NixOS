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

  fileSystems."/persistent" = {
    device = "/dev/disk/by-uuid/f753ef55-ffdd-476b-9991-452c07c6b1e9";
    fsType = "btrfs";
    neededForBoot = true;
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/6F10-C222";
    fsType = "vfat";
    options = [ "fmask=0077" "dmask=0077" ];
  };

  # LUKS device for /home/persistent
  boot.initrd.luks.devices."home" = {
    device = "/dev/disk/by-uuid/d9dc2b8f-346c-4222-b170-0056075796d4";
    keyFileSize = 2048;
    keyFile = "/dev/sda";
    fallbackToPassword = true;
  };

  fileSystems."/home/persistent" = {
    device = "/dev/disk/by-uuid/2458fb70-3b07-497a-bc2d-c351f6cc65d4";
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
