{ config, pkgs, ... }:

{
  imports = [
    ./boot.nix
    ./fonts.nix
    ./hardware-configuration.nix
    ./locale.nix
    ./mounts.nix
    ./nvidia.nix
    ./ollama.nix
    ./packages.nix
    ./programs.nix
    ./sound.nix
    ./users.nix
    ./virtualisation.nix
  ];

  system.stateVersion = "24.05";
  system.copySystemConfiguration = true;

  networking = {
    hostName = "Bulletstorm";
    networkmanager.enable = true;
  };

  time.timeZone = "Asia/Tbilisi";

  services = {
    xserver = {
      enable = true;
      displayManager = { gdm.enable = true; };
      desktopManager.gnome.enable = true;
      xkb = {
        layout = "us";
        variant = "";
      };
      videoDrivers = [ "nvidia" ];
    };
    printing.enable = true;
  };

  systemd.services = {
    "getty@tty1".enable = false;
    "autovt@tty1".enable = false;
  };

  systemd.extraConfig = ''
    DefaultTimeoutStopSec=10s
  '';

  hardware.opengl = { enable = true; };
}
