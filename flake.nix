# flake.nix

{
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/release-24.11";

  outputs = { nixpkgs, ... }: {
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
        ./nas.nix
        ./nvidia.nix
        ./ollama.nix
        ./prevent-sleep.nix
        ./programs.nix
        ./qemu.nix
        ./sound.nix
        ./ssh.nix
        ./users/asyavee.nix
        ./users/nett00n.nix
        ./users/nett00n-packages.nix
        ./users/wildetahorg.nix
        ./X11.nix
        ./hyprland.nix
      ];
    };

    nixosConfigurations.bulletstorm = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./boot.nix
        ./configuration.nix
        ./docker-directories-create.nix
        ./docker.nix
        ./fonts.nix
        ./locale.nix
        ./machines/bulletstorm/hardware-configuration.nix
        ./machines/bulletstorm/host.nix
        ./machines/bulletstorm/mounts.nix
        ./nvidia.nix
        ./ollama.nix
        ./programs.nix
        ./sound.nix
        ./ssh.nix
        ./users/asyavee.nix
        ./users/nett00n.nix
        ./users/nett00n-packages.nix
        ./users/wildetahorg.nix
        ./X11.nix
      ];
    };

    nixosConfigurations.apotheon = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./boot.nix
        ./configuration.nix
        ./fonts.nix
        ./locale.nix
        ./machines/apotheon/hardware-configuration.nix
        ./machines/apotheon/host.nix
        ./programs.nix
        ./sound.nix
        ./ssh.nix
        ./touchpad.nix
        ./users/alice.nix
        ./users/alice-autologin.nix
        ./users/nett00n.nix
        ./X11.nix
      ];
    };
    nixosConfigurations.snowrunner = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./boot.nix
        ./configuration.nix
        ./docker-directories-create.nix
        ./docker.nix
        ./fonts.nix
        ./hyprland.nix
        ./locale.nix
        ./machines/snowrunner/hardware-configuration.nix
        ./machines/snowrunner/host.nix
        ./programs.nix
        ./sound.nix
        ./ssh.nix
        ./touchpad.nix
        ./users/nett00n.nix
        ./users/nett00n-packages.nix
        ./X11.nix
      ];
    };
  };
}
