# alice.nix

{ config, pkgs, ... }: {
  users.users.alice = {
    isNormalUser = true;
    description = "alice";
    extraGroups = [ "networkmanager" ];
    uid = 10001;
  };
}
