{

  fileSystems =
    let
      contentPath = "/media/Content";
      gamesPath = "/media/Games";
    in
    {
      "/media/Content" = {
        device = "/dev/disk/by-partuuid/7e0d7518-14b6-481c-acae-0499ab73284e";
        fsType = "xfs";
        options = [ "defaults" "nofail" ];
      };
      "/media/Games" = {
        device = "/dev/mapper/vg0-games";
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
    };

  services.samba = {
    enable = true;
    securityType = "user";
    openFirewall = true;
    extraConfig = ''
      workgroup = WORKGROUP
      server string = smbnix
      netbios name = smbnix
      security = user
      #use sendfile = yes
      #max protocol = smb2
      # note: localhost is the ipv6 localhost ::1
      hosts allow = 192.168.0. 127.0.0.1 localhost
      hosts deny = 0.0.0.0/0
      guest account = nobody
      map to guest = bad user
    '';
    shares = {
      public = {
        path = "/Downloads";
        browseable = "yes";
        "read only" = "no";
        "guest ok" = "no ";
        "create mask" = "0664";
        "directory mask" = "0775";
        "force user" = "nett00n";
        "force group" = "users";
      };
    };
  };

  services.samba-wsdd = {
    enable = true;
    openFirewall = true;
  };

}
