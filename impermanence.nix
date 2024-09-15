{
  environment.persistence."/persistent" = {
    hideMounts = true;
    directories = [
      "/nix"
      "/var/log"
      "/var/lib/nixos"
      "/var/lib/bluetooth"
      "/var/lib/rfkill" # Remember which devices (wifi, bluetooth) are off
      "/var/lib/systemd/coredump"
      "/etc" # For mutable passwords/without hardcoding hashedPassword (couldn't get hashedPasswordFile to work)
      "/home"
    ];
    files = [ "/etc/machine-id" ];
  };
}
