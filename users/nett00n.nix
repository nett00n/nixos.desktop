# nett00n.nix

{ config, pkgs, ... }: {
  users.users.nett00n = {
    isNormalUser = true;
    description = "nett00n";
    extraGroups =
      [ "docker" "kvm" "networkmanager" "ssh-users" "wheel" "gamemode" "sudo" ];
    uid = 1000;
  };

}
