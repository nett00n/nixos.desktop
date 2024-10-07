# configuration.nix

{
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  system.stateVersion = "24.11";
  security.sudo.wheelNeedsPassword = false;
  time.timeZone = "Asia/Tbilisi";
}
