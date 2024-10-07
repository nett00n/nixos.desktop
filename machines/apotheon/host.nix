{ config, lib, pkgs, ... }:

{
  networking.hostName = "apotheon";
  services.touchegg.enable = true;
  services.libinput.enable = true;
}
