# nvidia.nix

{ config, ... }: {
  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
    open = false;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.production;
  };
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia-container-toolkit.enable = true;
  hardware.enableRedistributableFirmware = true;  # Ensures firmware for GPU is available
  hardware.opengl.enable = true;  # If OpenGL support is required
}
