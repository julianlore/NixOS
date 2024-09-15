{
  environment.persistence."/persistent" = {
    hideMounts = true;
    directories = [
      "/nix"
      "/var/log"
      "/var/lib/nixos"
      "/var/lib/bluetooth"
      "/var/lib/systemd/coredump"
      "/etc/NetworkManager"
      "/home"
    ];
    files = [ "/etc/machine-id" ];
  };
}
