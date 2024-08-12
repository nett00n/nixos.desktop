{ config, pkgs, ... }: {
  users.users.nett00n = {
    isNormalUser = true;
    description = "nett00n";
    extraGroups = [ "networkmanager" "wheel" "docker" ];
  };
  services.xserver.displayManager.autoLogin = {
    enable = true;
    user = "nett00n";
  };
}
