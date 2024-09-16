{ config, pkgs, ... }:

{

  networking.hostName = "bulletstorm";
  imports = [
    ./boot.nix
    ./common.nix
    ./fonts.nix
    ./gaming.nix
    ./hardware-configuration.nix
    ./locale.nix
    ./mounts.nix
    ./nas.nix
    # ./nix-ld.nix
    ./nvidia.nix
    ./ollama.nix
    ./programs.nix
    ./sound.nix
    ./ssh.nix
    ./users/alice.nix
    ./users/autologin.nix
    ./users/nett00n.nix
    ./virtualisation.nix
    ./X11.nix
  ];
}
