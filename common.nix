{
  system.stateVersion = "24.05";
  networking.networkmanager.enable = true;
  time.timeZone = "Asia/Tbilisi";
  hardware.enableAllFirmware = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nix.optimise.automatic = true;
  nix.optimise.dates = [ "03:45" ];
  nix.gc = {
    automatic = true;
    dates = "daily";
    options = "--delete-older-than 30d";
  };
  nixpkgs.config.allowUnfree = true;
}
