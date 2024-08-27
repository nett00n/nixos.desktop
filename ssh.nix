{
  services.openssh.enable = true;
  services.openssh.settings.AllowGroups = [ "ssh-users" ];
  services.openssh.settings.AllowUsers = [ "nett00n" ];
  services.openssh.settings.PasswordAuthentication = false;
  services.openssh.settings.PermitRootLogin = "no";
}
