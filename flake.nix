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
    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    plugin-telescope-recent-files = {
      url = "github:smartpde/telescope-recent-files";
      flake = false;
    };
    plugin-fish-abbreviation-tips = {
      url = "github:Gazorby/fish-abbreviation-tips";
      flake = false;
    };
  };

  outputs = inputs@{ nixpkgs, home-manager, jovian, ... }: {
    nixosConfigurations.JollyJoy = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./configuration.nix
        ./graphical.nix
        ./hosts/JollyJoy
        jovian.nixosModules.default
        home-manager.nixosModules.home-manager
        { home-manager.extraSpecialArgs = inputs; }
      ];
    };
  };
}
