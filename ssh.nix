{
  services.openssh.enable = true;
  services.openssh.settings.AllowGroups = [ "wheel" ];
  services.openssh.settings.PasswordAuthentication = false;
  services.openssh.settings.PermitRootLogin = "no";
}
