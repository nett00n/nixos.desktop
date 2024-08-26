{ config, pkgs, ... }: {
  users.users.nett00n = {
    isNormalUser = true;
    description = "nett00n";
    extraGroups = [
      "docker"
      "kvm"
      "networkmanager"
      "nix-users"
      "wheel"
      ];
  };
  services.xserver.displayManager.autoLogin = {
    enable = true;
    user = "nett00n";
  };
}
