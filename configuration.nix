{ config, pkgs, ... }:

{
  imports =
    [

      ./hardware-configuration.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "Bulletstorm";

  networking.networkmanager.enable = true;

  time.timeZone = "Asia/Tbilisi";

  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  services.xserver.enable = true;

  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  services.xserver = {
    xkb.layout = "us";
    xkb.variant = "";
  };

  services.printing.enable = true;

  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  users.users.nett00n = {
    isNormalUser = true;
    description = "nett00n";
    extraGroups = [ "networkmanager" "wheel" "docker" ];
    packages = with pkgs; [
      alacritty
      cudatoolkit
      docker
      flameshot
      gh
      git
      glab
      hyfetch
      keystore-explorer
      mc
      meld
      neovim
      nerdfonts
      nixpkgs-fmt
      nvtopPackages.full
      obsidian
      python3
      python311Packages.pip
      python311Packages.virtualenv
      slack
      starship
      steamPackages.steam
      steamPackages.steam-runtime
      steamPackages.steamcmd
      telegram-desktop
      terraform
      thunderbird
      vlc
      vscode
    ];
  };

  services.xserver.displayManager.autoLogin.enable = true;
  services.xserver.displayManager.autoLogin.user = "nett00n";

  systemd.services."getty@tty1".enable = false;
  systemd.services."autovt@tty1".enable = false;

  programs.firefox.enable = true;

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs ; [
    cudaPackages.autoAddOpenGLRunpathHook
    nixpkgs-fmt
    nvidia-container-toolkit
  ];

  system.stateVersion = "24.05";
  hardware.opengl = {
    enable = true;
  };

  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.opengl.driSupport32Bit = true;

  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
    open = false;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.production;
  };

  virtualisation.docker = {
    enable = true;
    enableNvidia = true;
  };

  services.ollama = {
    enable = true;
    acceleration = "cuda";
  };

  services.flatpak.enable = true;
  fileSystems."/media/Content" = {
    device = "/dev/disk/by-partuuid/7e0d7518-14b6-481c-acae-0499ab73284e";
    fsType = "xfs";
    options = [
      # If you don't have this options attribute, it'll default to "defaults"
      # boot options for fstab. Search up fstab mount options you can use
      "defaults"
      "nofail" # Prevent system from failing if this drive doesn't mount

    ];
  };

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
  };

  fileSystems."/media/Games" = {
    device = "/dev/disk/by-uuid/9a158d69-fb5f-4f72-abd8-1963eedb1bf4";
    fsType = "xfs";
    options = [
      # If you don't have this options attribute, it'll default to "defaults"
      # boot options for fstab. Search up fstab mount options you can use
      "defaults"
      "nofail" # Prevent system from failing if this drive doesn't mount

    ];
  };

  fileSystems."/Data" = {
    device = "/home/Data";
    options = [
      "bind"
      "nofail"
      ];
  };
  fileSystems."/Stacks" = {
    device = "/home/Stacks";
    options = [
      "bind"
      "nofail"
      ];
  };
}
