{ pkgs, lib, ... }: {
  imports = [ ./wireguard/main-computer.nix ./impermanence.nix ];
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

  programs.firejail = {
    enable = true;
    wrappedBinaries = {
      firefox = {
        executable = "${lib.getBin pkgs.firefox}/bin/firefox";
        profile = "${pkgs.firejail}/etc/firejail/firefox.profile";
        extraArgs = [ "--netns=vpn1" ];
      };
      firefoxnovpn = {
        executable = "${lib.getBin pkgs.firefox}/bin/firefox";
        profile = "${pkgs.firejail}/etc/firejail/firefox.profile";
      };
      firefoxvps = {
        executable = "${lib.getBin pkgs.firefox}/bin/firefox";
        profile = "${pkgs.firejail}/etc/firejail/firefox.profile";
        extraArgs = [ "--netns=vpsvpn" ];
      };
      chromium = {
        executable = "${lib.getBin pkgs.chromium}/bin/chromium";
        profile = "${pkgs.firejail}/etc/firejail/chromium.profile";
      };
      chromiumvpn = {
        executable = "${lib.getBin pkgs.chromium}/bin/chromium";
        profile = "${pkgs.firejail}/etc/firejail/chromium.profile";
        extraArgs = [ "--netns=vpn1" ];
      };
      chromiumvps = {
        executable = "${lib.getBin pkgs.chromium}/bin/chromium";
        profile = "${pkgs.firejail}/etc/firejail/chromium.profile";
        extraArgs = [ "--netns=vpsvpn" ];
      };
    };
  };

  home-manager.users.jl = {
    imports = [ ./home-manager/common.nix ./home-manager/main-computer.nix ];
  };
}
