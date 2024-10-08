# asyavee.nix

{ config, pkgs, ... }: {
  programs.fish.enable = true;
  users.users.asyavee = {
    isNormalUser = true;
    description = "asyavee";
    shell = pkgs.fish;

    extraGroups =
      [ "docker" "kvm" "networkmanager" "ssh-users" "wheel" "gamemode" "sudo" ];
    uid = 1003;
  };
  users.users.asyavee.packages = with pkgs;
    [
      # postman
      adapta-backgrounds
    ];
}
