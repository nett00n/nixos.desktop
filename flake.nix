{
  description = "My NixOS Configuration";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable"; # or a specific version
  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = { self, nixpkgs, flake-utils }: flake-utils.lib.eachDefaultSystem (system: {
    nixosConfigurations.bulletstorm = nixpkgs.nixosSystem {
      system = "x86_64-linux"; # or your architecture
      modules = [
        ./configuration.bulletstorm.nix 
      ];
    };
  });
}
