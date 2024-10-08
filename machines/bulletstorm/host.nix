# host.nix

{ config, lib, pkgs, ... }:

{
  networking.hostName = "bulletstorm";
  system.stateVersion = "24.05";
}
