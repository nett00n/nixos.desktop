{
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
      timeout = 3;
    };
    kernelModules = [ "kvm-amd" "kvm-intel" ];
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
