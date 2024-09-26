{
  imports = [ ./impermanence-jl.nix ];
  users.users.jl.hashedPasswordFile = "/persistent/home/jl/jl-shadow";
  users.mutableUsers = false;
  environment.persistence."/persistent" = {
    hideMounts = true;
    # Documentation about what is vital to persist for NixOS: /boot, /nix, /var/lib/nixos
    # https://github.com/NixOS/nixpkgs/blob/master/nixos/doc/manual/administration/nixos-state.section.md
    directories = [
      "/nix"
      "/var/log"
      "/var/lib/nixos"
      "/var/lib/bluetooth"
      "/var/lib/NetworkManager" # Remember if wifi is off, as NetworkManager manages it
      "/var/lib/systemd/coredump"
      "/etc/NetworkManager"
    ];
    files = [ "/etc/machine-id" ];
  };
}
