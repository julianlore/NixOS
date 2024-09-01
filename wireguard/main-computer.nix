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
  ];
}
