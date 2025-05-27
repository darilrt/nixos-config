{
  description = "";

  inputs = {
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, ... }: {
    nixosConfigurations = {
      daril-personal = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./system/configuration.nix
          home-manager.nixosModules.home-manager {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.daril = ./home/personal.nix;
          }
        ];
      };
      daril-work = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./system/configuration.nix
          home-manager.nixosModules.home-manager {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.daril = {
              imports = [ ./home/work.nix ];
            };
          }
        ];
      };
    };

    homeConfigurations = {
      daril-personal = home-manager.lib.homeManagerConfiguration {
        name = "daril";
        configuration = ./home/personal.nix;
      };
      daril-work = home-manager.lib.homeManagerConfiguration {
        name = "daril";
        configuration = ./home/work.nix;
      };
    };
  };
}
