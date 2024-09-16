{ config, pkgs, ... }:

{
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  system.stateVersion = "24.05";

  networking.hostName = "apotheon";
  imports = [
    ./boot.nix
    ./common.nix
    ./fonts.nix
    ./hardware-configuration.nix
    ./locale.nix
    # ./mounts.nix
    # ./nix-ld.nix
    ./ollama.nix
    ./programs.nix
    ./sound.nix
    ./ssh.nix
    ./users/nett00n.nix
    ./virtualisation.nix
    ./X11.nix
  ];
}
