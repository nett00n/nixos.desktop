{
  system.stateVersion = "24.05";
  networking.networkmanager.enable = true;
  time.timeZone = "Asia/Tbilisi";
  hardware.enableAllFirmware = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}