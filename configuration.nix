# configuration.nix

{
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  security.sudo.wheelNeedsPassword = false;
  time.timeZone = "Asia/Tbilisi";
  services.xserver.displayManager.gdm.wayland = false;
  system.stateVersion = "24.05";
}
