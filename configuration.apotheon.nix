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
  # Make macbook keyboard usable: ctrl, fn, super, alt and fn buttons work like fn, not media
  boot.extraModprobeConfig = ''
    options hid_apple fnmode=2
    options hid_apple swap_opt_cmd=1
    options hid_apple swap_fn_leftctrl=1
  '';

}
