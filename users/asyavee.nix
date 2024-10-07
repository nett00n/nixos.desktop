# asyavee.nix

{ config, pkgs, ... }: {
  users.users.asyavee = {
    isNormalUser = true;
    description = "asyavee";
    shell = pkgs.fish;

    extraGroups =
      [ "docker" "kvm" "networkmanager" "ssh-users" "wheel" "gamemode" "sudo" ];
    uid = 1003;
  };
  users.users.asyavee.packages = with pkgs; [ fish ];
}
