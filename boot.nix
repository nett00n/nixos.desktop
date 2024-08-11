{
  boot = {
    consoleLogLevel = 0;
    initrd.verbose = false;
    kernelParams = [
      "quiet"
      "splash"
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
}