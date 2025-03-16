# boot.nix

{ pkgs, ... }:{
  boot = {
    consoleLogLevel = 0;
    initrd.verbose = false;
    kernelParams = [
      "quiet"
      "boot.shell_on_fail"
      "loglevel=3"
      "rd.systemd.show_status=false"
      "rd.udev.log_level=3"
      "udev.log_priority=3"
    ];
    loader = {
      systemd-boot.consoleMode = "auto";
      efi.canTouchEfiVariables = true;
      systemd-boot.enable = true;
      efi.efiSysMountPoint = "/boot";
      timeout = 3;
    };
    plymouth = {
      enable = true;
      theme = "hexa_retro";
      themePackages = with pkgs; [

        # By default we would install all themes
        (adi1090x-plymouth-themes.override {
          selected_themes = [ "hexa_retro" ];
        })
      ];
    };
  };
  systemd.services = {
    "getty@tty1".enable = false;
    "autovt@tty1".enable = false;
  };
  # This reduces graceful kill period for processes on shutdown
  # Speeds up shutdown and reboot
  systemd.extraConfig = ''
    DefaultTimeoutStopSec=10s
  '';

}
