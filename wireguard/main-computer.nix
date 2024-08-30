{ pkgs, lib, ... }: {
  imports = [
    (import ./service.nix {
      inherit lib;
      inherit pkgs;
      name = "vpn1";
      wg-interface = "wg0";
      ip = "10.2.0.2/32";
      dns = "10.2.0.1";
      conf = "/home/jl/wg/main.conf";
      at-boot = true;
    })
    (import ./service.nix {
      inherit lib;
      inherit pkgs;
      name = "vps-vpn";
      wg-interface = "wg1";
      ip = "10.13.13.2/32";
      dns = "10.2.0.100";
      conf = "/home/jl/wg/vps.conf";
      at-boot = false;
    })
    (import ./service.nix {
      inherit lib;
      inherit pkgs;
      name = "vpscad-vpn";
      wg-interface = "wg2";
      ip = "10.14.14.6/32";
      dns = "10.14.14.1";
      conf = "/home/jl/wg/vpscad.conf";
      at-boot = false;
    })
  ];
}
