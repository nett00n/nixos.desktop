# host.nix

{ config, lib, pkgs, ... }:

{
  networking.hostName = "reka";
services.xserver.displayManager.gdm.wayland = false;
}
