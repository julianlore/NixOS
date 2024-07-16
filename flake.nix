{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    jovian = {
      url = "github:Jovian-Experiments/Jovian-NixOS";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    plugin-telescope-recent-files = {
      url = "github:smartpde/telescope-recent-files";
      flake = false;
    };
  };

  outputs = inputs@
    { nixpkgs,
      home-manager,
      jovian,
      ... }:
    {
    nixosConfigurations.JollyJoy = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./configuration.nix
        ./JollyJoy-hardware-configuration.nix
        jovian.nixosModules.default
        ./Jovian-SteamDeck.nix
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.extraSpecialArgs = inputs;
          home-manager.users.jl = import ./home-manager/home.nix;
        }
      ];
    };
  };
}
