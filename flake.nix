{
  description = "A simple NixOS flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    home-manager.url = "github:nix-community/home-manager/release-24.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    nixvim.url = "github:nix-community/nixvim/nixos-24.11";
    nixvim.inputs.nixpkgs.follows = "nixpkgs";

    stylix.url = "github:danth/stylix/release-24.11";
    base16.url = "github:SenchoPens/base16.nix";

    ignis.url = "git+https://github.com/linkfrg/ignis?submodules=1";
  };

  outputs = { self, nixpkgs, nixvim, stylix, nixos-hardware, home-manager, base16, ... } @ inputs: let
  pc-background = ./wallpapers/dark-cat-rosewater.png;
  laptop-background = ./wallpapers/nixos-wallpaper-catppuccin-macchiato.png;
  in {

    nixosConfigurations.liam-laptop-nixos = inputs.nixpkgs.lib.nixosSystem { 
      system = "x86_64-linux";
      modules = [
        ./hosts/liam-laptop-nixos/configuration.nix
        nixos-hardware.nixosModules.dell-xps-15-9560
        stylix.nixosModules.stylix
        base16.nixosModule
  
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
          home-manager.extraSpecialArgs = {
            inherit inputs laptop-background;
          };
        }
      ];
      specialArgs = {
        inherit inputs laptop-background;
      };
    };

    nixosConfigurations.liam-pc-nixos = inputs.nixpkgs.lib.nixosSystem { 
      system = "x86_64-linux";
      modules = [
        ./hosts/liam-pc-nixos/configuration.nix
        stylix.nixosModules.stylix
        base16.nixosModule
  
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.liamwb = import ./hosts/liam-pc-nixos/home.nix;
          home-manager.backupFileExtension = "backup"; # create a backup on collision
          home-manager.sharedModules = [
            nixvim.homeManagerModules.nixvim
          ];

          # Optionally, use home-manager.extraSpecialArgs to pass
          # arguments to home.nix
          home-manager.extraSpecialArgs = {
            inherit inputs pc-background;
          };
        }
      ];
      specialArgs = {
        inherit inputs pc-background;
      };
    };

    homeConfigurations."phduser" = home-manager.lib.homeManagerConfiguration {
	pkgs = nixpkgs.legacyPackages."x86_64-linux";
	
	

	modules = [ 
		./hosts/liam-pc-phd/home.nix 
		nixvim.homeManagerModules.nixvim
		stylix.homeManagerModules.stylix
		];
    };
  };
}
