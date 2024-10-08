# host.nix

{ config, lib, pkgs, ... }:

{
  networking.hostName = "reka";
  system.stateVersion = "24.11";
}
