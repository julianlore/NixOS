{ pkgs, ... }:
{
  # Enable common container config files in /etc/containers
  virtualisation.containers.enable = true;
  virtualisation = {
    podman = {
      enable = true;

      # Required for containers under podman-compose to be able to talk to each other.
      defaultNetwork.settings.dns_enabled = true;
    };
  };

  environment.systemPackages = with pkgs; [ podman-compose ];

  # Redirect incoming (PREROUTING) and outgoing (OUTPUT) port 80 traffic to port 8080 to allow hosting services on port 8080 without privileged access
  # Same for port 443 to 8443
  networking.firewall.extraCommands = ''
    iptables -t nat -A PREROUTING -p tcp --dport 80 -j REDIRECT --to-port 8080
    iptables -t nat -A PREROUTING -p tcp --dport 443 -j REDIRECT --to-port 8443
    iptables -t nat -A OUTPUT --dst 127.0.0.1 -p tcp --dport 80 -j REDIRECT --to-port 8080
    iptables -t nat -A OUTPUT --dst 127.0.0.1 -p tcp --dport 443 -j REDIRECT --to-port 8443
  '';
}
