# autologin-alice.nix

{
  services.xserver.displayManager.autoLogin = {
    enable = true;
    user = "alice";
  };
}
