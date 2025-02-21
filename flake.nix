{
  description = "My very own flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs, ... } @ inputs :
  let inherit (self) outputs;
  in
  {
    nixpkgs.config.allowUnfree = true;
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs outputs; };
      modules = [
        ./config/configuration.nix
      ];
    };
    # homeConfigurations = {
    #   "marwan@nixos" = home-manager.lib.homeManagerConfiguration {
    #     pkgs = nixpkgs.legacyPackages.x86_64-linux;
    #     extraSpecialArgs = { inherit inputs outputs; };
    #     modules = [ ./home.nix ];
    #   };
    # };

    #homeConfigurations.marwan = home-manager.lib.homeManagerConfiguration {
      #pkgs = nixpkgs.legacyPackages.x86_64-linux;
      #modules = [ ./home/home.nix ];
    #};
  };
}
