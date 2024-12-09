# nvidia.nix

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
  hardware.enableRedistributableFirmware = true;
  virtualisation.docker.enableNvidia = true;
  environment.systemPackages = with pkgs; [ pkgs.nvidia-docker ];
}
