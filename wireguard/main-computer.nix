{ pkgs, ... }: {
  imports = [
    (import ./service.nix {
      inherit pkgs;
      name = "vpn1";
      wg-interface = "wg0";
      ip = "10.2.0.2/32";
      dns = "10.2.0.1";
      conf = "/home/jl/wg/main.conf";
    })
    (import ./service.nix {
      inherit pkgs;
      name = "vpsvpn";
      wg-interface = "wg1";
      ip = "10.13.13.2/32";
      dns = "10.2.0.100";
      conf = "/home/jl/wg/vps.conf";
    })
    (import ./service.nix {
      inherit pkgs;
      name = "vpscadvpn";
      wg-interface = "wg2";
      ip = "10.14.14.6/32";
      dns = "10.14.14.1";
      conf = "/home/jl/wg/vpscad.conf";
    })
  ];
}
