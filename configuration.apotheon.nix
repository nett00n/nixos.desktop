{ config, pkgs, ... }:

{
  system.stateVersion = "24.05";

  networking = {
    hostName = "apotheon";
    networkmanager.enable = true;
  };

  time.timeZone = "Asia/Tbilisi";
  imports = [
    ./boot.nix
    ./fonts.nix
    ./hardware-configuration.nix
    ./locale.nix
    # ./mounts.nix
    # ./nix-ld.nix
    ./ollama.nix
    ./programs.nix
    ./sound.nix
    ./ssh.nix
    ./users.nix
    ./virtualisation.nix
    ./X11.nix
  ];
}
