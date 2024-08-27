{
  imports = [ ./hardware-configuration.nix ./Jovian-SteamDeck.nix ];

  networking.hostName = "JollyJoy";
  home-manager.users.jl = {
    imports =
      [ ../../home-manager/common.nix ../../home-manager/main-computer.nix ];
  };
}
