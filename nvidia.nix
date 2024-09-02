{ config, pkgs, ... }: {
  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
    open = false;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.production;
  };
  services.xserver.videoDrivers = [ "nvidia" ];
  virtualisation.podman.enableNvidia = true;
  virtualisation.docker.enableNvidia = true;
  hardware.opengl.driSupport32Bit = true;
}
