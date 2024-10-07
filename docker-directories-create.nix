{ config, pkgs, ... }:

{
  environment.etc."docker-directories-create.sh".text = ''
    #!${pkgs.bash}/bin/bash
    Directories="
      /Data
      /Stacks
      /home/Data
      /home/Stacks
      /home/nixos-config
      "
    for CurrentDirectory in $Directories; do
      mkdir -p "$CurrentDirectory"
      chown root:users "$CurrentDirectory"
    done
  '';

  environment.etc."docker-directories-create.sh".mode = "755";  # Ensure the script is executable

  systemd.services.docker-directories-create = {
    description = "Create basic directories";
    after = [ "network.target" ];

    serviceConfig = {
      ExecStart = "/etc/docker-directories-create.sh";
      Type = "oneshot";
      RemainAfterExit = true;
    };

    wantedBy = [ "multi-user.target" ];
  };
}
