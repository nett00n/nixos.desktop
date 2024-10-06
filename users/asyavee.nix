{ config, pkgs, ... }: {
  users.users.asyavee = {
    isNormalUser = true;
    description = "asyavee";
    extraGroups = [ "docker" "kvm" "networkmanager" "ssh-users" "wheel" "gamemode" "sudo" ];
    uid = 1003;
  };
}
