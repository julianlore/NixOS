{ pkgs, ... }: {
  imports = [ ./wireguard/main-computer.nix ];
  # Bypass rpfilter for 51820/wireguard using NetworkManager
  networking.firewall = {
    # wireguard trips rpfilter up
    extraCommands = ''
      ip46tables -t mangle -I nixos-fw-rpfilter -p udp -m udp --sport 51820 -j RETURN
      ip46tables -t mangle -I nixos-fw-rpfilter -p udp -m udp --dport 51820 -j RETURN
    '';
    extraStopCommands = ''
      ip46tables -t mangle -D nixos-fw-rpfilter -p udp -m udp --sport 51820 -j RETURN || true
      ip46tables -t mangle -D nixos-fw-rpfilter -p udp -m udp --dport 51820 -j RETURN || true
    '';
  };

  environment.systemPackages = with pkgs; [ cryptsetup ];

  services.udev.packages = [ pkgs.bazecor ];
}
