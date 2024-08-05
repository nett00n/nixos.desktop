{ config, pkgs, ... }:

{
  imports = [

    ./hardware-configuration.nix
  ];

  boot = {
    plymouth = {
      enable = true;
      theme = "colorful_sliced";
      themePackages = with pkgs;
        [
          # By default we would install all themes
          (adi1090x-plymouth-themes.override {
            selected_themes = [ "colorful_sliced" ];
          })
        ];
    };
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
      efi.canTouchEfiVariables = true;
      systemd-boot.enable = true;
      timeout = 3;
    };
  };

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
      dbeaver-bin
      flameshot
      gh
      glab
      hyfetch
      imagemagick
      keystore-explorer
      libreoffice
      libwebp
      lutris
      meld
      nixfmt-classic
      nvtopPackages.full
      obsidian
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
      yt-dlp
      zed-editor
      zoom-us
    ];
  };

  services.xserver.displayManager.autoLogin.enable = true;
  services.xserver.displayManager.autoLogin.user = "nett00n";

  systemd.services."getty@tty1".enable = false;
  systemd.services."autovt@tty1".enable = false;

  programs.firefox.enable = true;

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    cudaPackages.autoAddOpenGLRunpathHook
    cudatoolkit
    docker
    git
    mc
    neovim
    nerdfonts
    nixpkgs-fmt
    nvidia-container-toolkit
    pkgs.firefoxpwa
    python3
    python311Packages.pip
    python311Packages.virtualenv
  ];

  system.stateVersion = "24.05";
  hardware.opengl = { enable = true; };

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

  virtualisation = {
    docker = {
      enable = true;
      enableNvidia = true;
    };
  };

  services.ollama = {
    enable = true;
    acceleration = "cuda";
  };

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
    remotePlay.openFirewall =
      true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall =
      true; # Open ports in the firewall for Source Dedicated Server
    localNetworkGameTransfers.openFirewall =
      true; # Open ports in the firewall for Steam Local Network Game Transfers
  };

  programs.firefox = {
    # enable = true;
    package = pkgs.firefox;
    nativeMessagingHosts.packages = [ pkgs.firefoxpwa ];
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

  fileSystems."/Books" = {
    device = "/media/Content/Books/";
    options = [ "bind" "nofail" ];
  };
  fileSystems."/Comics" = {
    device = "/media/Content/Comics/";
    options = [ "bind" "nofail" ];
  };
  fileSystems."/Courses" = {
    device = "/media/Content/Videos/Courses/";
    options = [ "bind" "nofail" ];
  };
  fileSystems."/Data" = {
    device = "/home/Data";
    options = [ "bind" "nofail" ];
  };
  fileSystems."/Downloads" = {
    device = "/media/Content/Downloads/";
    options = [ "bind" "nofail" ];
  };
  fileSystems."/Games" = {
    device = "/media/Games";
    options = [ "bind" "nofail" ];
  };
  fileSystems."/Series" = {
    device = "/media/Content/Videos/Series/";
    options = [ "bind" "nofail" ];
  };
  fileSystems."/Stacks" = {
    device = "/home/Stacks";
    options = [ "bind" "nofail" ];
  };
}
