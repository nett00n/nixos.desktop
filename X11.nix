# X11.nix

{
  services = {
    xserver = {
      enable = true;
      displayManager = {
        gdm.enable = true;
        };
      desktopManager.gnome.enable = true;
      xkb = {
        layout = "us";
        variant = "";
      };

    };
    printing.enable = true;
  };
}
