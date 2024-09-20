{
  imports = [ ./impermanence-jl.nix ];
  # Persist mutable passwords. Note: does not allow changing passwords (probably overwritten by passwd) without replacing source file manually. Alternatively persist all of /etc.
  # https://github.com/nix-community/impermanence/issues/120
  environment.etc = {
    "group".source = "/persistent/etc/group";
    "passwd".source = "/persistent/etc/passwd";
    "shadow".source = "/persistent/etc/shadow";
  };
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
