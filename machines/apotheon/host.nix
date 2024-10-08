# host.nix

{ config, lib, pkgs, ... }:

{
  networking.hostName = "apotheon";
  system.stateVersion = "24.11";
}
