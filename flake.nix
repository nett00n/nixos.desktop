# flake.nix

{
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  inputs.nixpkgs-stable.url = "github:NixOS/nixpkgs/release-24.05";
  inputs.disko.url = "github:nix-community/disko";
  inputs.disko.inputs.nixpkgs.follows = "nixpkgs";
  inputs.nixos-facter-modules.url = "github:numtide/nixos-facter-modules";

  outputs = { nixpkgs, nixpkgs-stable, disko, nixos-facter-modules, ... }: {
    nixosConfigurations.reka = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./boot.nix
        ./configuration.nix
        ./docker-directories-create.nix
        ./docker.nix
        ./fonts.nix
        ./gaming.nix
        ./locale.nix
        ./machines/reka/hardware-configuration.nix
        ./machines/reka/host.nix
        ./nvidia.nix
        ./ollama.nix
        ./prevent-sleep.nix
        ./programs.nix
        ./qemu.nix
        ./sound.nix
        ./ssh.nix
        ./users/asyavee.nix
        ./users/nett00n.nix
        ./users/wildetahorg.nix
        ./X11.nix
        disko.nixosModules.disko
      ];
    };

    nixosConfigurations.bulletstorm = nixpkgs-stable.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./boot.nix
        ./configuration.nix
        ./docker-directories-create.nix
        ./docker.nix
        ./fonts.nix
        ./gaming.nix
        ./locale.nix
        ./machines/bulletstorm/hardware-configuration.nix
        ./machines/bulletstorm/host.nix
        ./machines/bulletstorm/mounts.nix
        ./nvidia.nix
        ./ollama.nix
        ./programs.nix
        ./qemu.nix
        ./sound.nix
        ./ssh.nix
        ./users/asyavee.nix
        ./users/nett00n.nix
        ./users/wildetahorg.nix
        ./X11.nix
        disko.nixosModules.disko
      ];
    };

    nixosConfigurations.apotheon = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./boot.nix
        ./configuration.nix
        ./docker-directories-create.nix
        ./docker.nix
        ./fonts.nix
        ./locale.nix
        ./machines/apotheon/hardware-configuration.nix
        ./machines/apotheon/host.nix
        ./ollama.nix
        ./programs.nix
        ./qemu.nix
        ./sound.nix
        ./ssh.nix
        ./touchpad.nix
        ./users/nett00n.nix
        ./X11.nix
        disko.nixosModules.disko
      ];
    };
  };
}
