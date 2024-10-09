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

  environment.etc."nas-init.sh".mode = "755";  # Ensure the script is executable

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
}
