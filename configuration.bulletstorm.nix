{ config, pkgs, ... }:

{
  system.stateVersion = "24.05";

  networking = {
    hostName = "Bulletstorm";
    networkmanager.enable = true;
  };

  time.timeZone = "Asia/Tbilisi";
  services.openssh.enable = true;
  services.openssh.settings.AllowGroups = [
    "ssh-users"
  ];
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
