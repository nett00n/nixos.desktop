{
  services.openssh.enable = true;
  services.openssh.settings.AllowUsers = [ "nett00n" ];
  services.openssh.settings.PasswordAuthentication = false;
  services.openssh.settings.PermitRootLogin = "no";
}
