{ config, pkgs, ... }:

{

  networking.hostName = "bulletstorm";
  imports = [
    ./boot.nix
    ./common.nix
    ./fonts.nix
    ./hardware-configuration.nix
    ./locale.nix
    ./mounts.nix
    # ./nix-ld.nix
    ./nvidia.nix
    ./ollama.nix
    ./programs.nix
    ./sound.nix
    ./ssh.nix
    ./users.nix
    ./virtualisation.nix
    ./X11.nix
  ];
}
