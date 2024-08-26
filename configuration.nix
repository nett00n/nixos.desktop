{ config, pkgs, ... }:

{
  system.stateVersion = "24.05";

  networking = {
    hostName = "Bulletstorm";
    networkmanager.enable = true;
  };

  time.timeZone = "Asia/Tbilisi";

  imports = [
    ./boot.nix
    ./fonts.nix
    ./hardware-configuration.nix
    ./locale.nix
    ./mounts.nix
    ./nix-ld.nix
    ./nvidia.nix
    ./ollama.nix
    ./programs.nix
    ./sound.nix
    ./users.nix
    ./virtualisation.nix
    ./X11.nix
  ];
}
