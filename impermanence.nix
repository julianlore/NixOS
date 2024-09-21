{
  imports = [ ./impermanence-jl.nix ];
  users.users.jl.hashedPasswordFile = "/persistent/home/jl/jl-shadow";
  users.mutableUsers = false;
  environment.persistence."/persistent" = {
    hideMounts = true;
    directories = [
      "/nix"
      "/var/log"
      "/var/lib/nixos"
      "/var/lib/bluetooth"
      "/var/lib/systemd/rfkill" # Remember which devices (wifi, bluetooth) are off
      "/var/lib/systemd/coredump"
      "/etc/NetworkManager"
    ];
    files = [ "/etc/machine-id" ];
  };
}
