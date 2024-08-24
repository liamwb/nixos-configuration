{
  description = "A simple NixOS flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    home-manager.url = "github:nix-community/home-manager/release-24.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    nixvim.url = "github:nix-community/nixvim/nixos-24.05";
    nixvim.inputs.nixpkgs.follows = "nixpkgs";

    stylix.url = "github:danth/stylix";
  };

  outputs = inputs@{ self, nixpkgs, nixvim, stylix, nixos-hardware, home-manager, ... }: {

    nixosConfigurations.liam-laptop-nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./hosts/liam-laptop-nixos/configuration.nix
        nixos-hardware.nixosModules.dell-xps-15-9560
        stylix.nixosModules.stylix
  
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.liamwb = import ./hosts/liam-laptop-nixos/home.nix;
          home-manager.backupFileExtension = "backup"; # create a backup on collision
          home-manager.sharedModules = [
            nixvim.homeManagerModules.nixvim
          ];

          # Optionally, use home-manager.extraSpecialArgs to pass
          # arguments to home.nix
        }
      ];
    };
  };
}
