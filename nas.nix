{ config, pkgs, ... }:

{
  environment.etc."nas-init.sh".text = ''
    #!${pkgs.bash}/bin/bash
    Directories="
      /Cinema
      /Downloads
      /Series
      /Books
      /Music
      "
    for CurrentDirectory in $Directories; do
      mkdir -p "$CurrentDirectory"
      chown 1000:users "$CurrentDirectory"
      chmod 0775 "$CurrentDirectory"
    done
  '';

  environment.etc."nas-init.sh".mode = "755";

  systemd.services.nas-init = {
    description = "Create basic directories";
    after = [ "network.target" ];

    serviceConfig = {
      ExecStart = "/etc/nas-init.sh";
      Type = "oneshot";
      RemainAfterExit = true;
    };

    wantedBy = [ "multi-user.target" ];
  };

  systemd.services.fdupesService = {
    description = "Run fdupes to find and delete duplicate files";
    serviceConfig.ExecStart =
      "${pkgs.fdupes}/bin/fdupes -rnNH /Books/ /Cinema/ /Downloads/ /Music/ /Series/";
    wantedBy = [ "multi-user.target" ];
  };

  systemd.timers.fdupesTimer = {
    description = "Run fdupes every day at 3 AM";
    unitConfig.OnCalendar = "03:00:00";
    unitConfig.Unit = "fdupesService.service";
  };
}
