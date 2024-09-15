# Based off of https://samasaur1.github.io/blog/multiple-vpns-on-nixos
# Creates a systemd service for a Wireguard interface in a network namespace.
# Example args:
# imports = [
#   (import ./service.nix {
#     inherit pkgs;
#     name = "vpn1"; # - in name can cause problems (treated as / for netns@${name}?)
#     wg-interface = "wg0";
#     ip = "10.1.0.2/32";
#     dns = "10.1.0.1"
#     conf = "/path/to/wg0.conf";
#   })
# ];
# Make sure to remove/comment Address and DNS from conf. Conf name does not matter/need to match interface.
{ pkgs, name, wg-interface, ip, dns, conf }: {
  systemd.services.${name} = {
    description = "wg ${name} network interface";
    bindsTo = [ "netns@${name}.service" ];
    requires = [ "network-online.target" ];
    after = [ "netns@${name}.service" ];
    wantedBy = [ "multi-user.target" ];
    serviceConfig = {
      Type = "oneshot";
      RemainAfterExit = true;
      # Only start service if the configuration file exists. This allows declaring many services (which are enabled), but can be toggled off at boot by renaming the file.
      ExecStartPre = "${pkgs.coreutils}/bin/test -f ${conf}";
      ExecStart = with pkgs;
        writers.writeBash "wg-up" ''
          set -e
          ${iproute}/bin/ip link add ${wg-interface} type wireguard
          ${iproute}/bin/ip link set ${wg-interface} netns ${name}
          ${iproute}/bin/ip -n ${name} address add ${ip} dev ${wg-interface}
          ${iproute}/bin/ip netns exec ${name} \
          ${wireguard-tools}/bin/wg setconf ${wg-interface} ${conf}
          ${iproute}/bin/ip -n ${name} link set ${wg-interface} up
          ${iproute}/bin/ip -n ${name} route add default dev ${wg-interface}
        '';
      ExecStop = with pkgs;
        writers.writeBash "wg-down" ''
          ${iproute}/bin/ip -n ${name} route del default dev ${wg-interface}
          ${iproute}/bin/ip -n ${name} link del ${wg-interface}
        '';
    };
  };
  environment.etc."netns/${name}/resolv.conf".text = "nameserver ${dns}";
}
