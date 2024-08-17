{

  fileSystems = let
    contentPath = "/media/Content";
    gamesPath = "/media/Games";
  in {
    "/media/Content" = {
      device = "/dev/disk/by-partuuid/7e0d7518-14b6-481c-acae-0499ab73284e";
      fsType = "xfs";
      options = [ "defaults" "nofail" ];
    };
    "/media/Games" = {
      device = "/dev/disk/by-uuid/9a158d69-fb5f-4f72-abd8-1963eedb1bf4";
      fsType = "xfs";
      options = [ "defaults" "nofail" ];
    };
    "/Books" = {
      device = "${contentPath}/Books/";
      options = [ "bind" "nofail" ];
    };
    "/Comics" = {
      device = "${contentPath}/Comics/";
      options = [ "bind" "nofail" ];
    };
    "/Courses" = {
      device = "${contentPath}/Videos/Courses/";
      options = [ "bind" "nofail" ];
    };
    "/Cinema" = {
      device = "${contentPath}/Videos/Cinema/";
      options = [ "bind" "nofail" ];
    };
    "/Data" = {
      device = "/home/Data";
      options = [ "bind" "nofail" ];
    };
    "/Downloads" = {
      device = "${contentPath}/Downloads/";
      options = [ "bind" "nofail" ];
    };
    "/Games" = {
      device = "${gamesPath}";
      options = [ "bind" "nofail" ];
    };
    "/Music" = {
      device = "${contentPath}/Music/";
      options = [ "bind" "nofail" ];
    };
    "/Series" = {
      device = "${contentPath}/Videos/Series/";
      options = [ "bind" "nofail" ];
    };
    "/Stacks" = {
      device = "/home/Stacks";
      options = [ "bind" "nofail" ];
    };
  };

}
