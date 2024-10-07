# mounts.nix

{ config, pkgs, ... }: {
  fileSystems."/media/Games" = {
    device = "/dev/mapper/vg0-games";
    options = [ "defaults" "nofail" ];
    fsType = "xfs";
  };
  fileSystems."/Games" = {
    device = "/dev/mapper/vg0-games";
    options = [ "defaults" "nofail" ];
    fsType = "xfs";
  };
}
