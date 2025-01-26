# nas.nix

{ config, pkgs, ... }:

{
  environment.etc."nas-init.sh".text = ''
    #!${pkgs.bash}/bin/bash

    # Loop over the passed directories and create them
    for CurrentDirectory in "$@"; do
      mkdir -p "$CurrentDirectory"
      chown 1000:users "$CurrentDirectory"
      chmod 0775 "$CurrentDirectory"
    done

    find /Stacks -maxdepth 2 -name "docker-compose.yml" | sort | uniq | while read compose_file; do
      # Go to the directory of the compose file
      dir=$(dirname "$compose_file")
      cd "$dir" || exit 1

      # Run docker compose up -d
      echo "Running docker compose up -d in $dir"
      ${pkgs.docker}/bin/docker compose up -d

      # Go back to the original directory
      cd - || exit 1
    done
  '';

  environment.etc."nas-init.sh".mode = "755";

  systemd.services.nas-init = {
    description = "Create basic directories";
    after = [ "network.target" ];

    serviceConfig = {
      # Pass the list of directories to the script as arguments
      ExecStart = "/etc/nas-init.sh /Cinema /Downloads /Series /Books /Music";
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
