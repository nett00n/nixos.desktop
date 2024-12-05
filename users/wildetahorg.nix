# wildetahorg.nix

{ config, pkgs, ... }: {
  users.users.wildetahorg = {
    isNormalUser = true;
    description = "wildetahorg";
    extraGroups =
      [ "docker" "kvm" "networkmanager" "ssh-users" "wheel" "gamemode" "sudo" ];
    uid = 1002;
  };
  users.users.wildetahorg.packages = with pkgs;
    [
      # postman
      adapta-backgrounds
      localsend
    ];
}
