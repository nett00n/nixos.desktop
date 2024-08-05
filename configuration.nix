{ config, pkgs, ... }:

{
  imports = [ ./hardware-configuration.nix ];

  boot = {
    plymouth = {
      enable = true;
      theme = "colorful_sliced"; # https://github.com/adi1090x/plymouth-themes
      themePackages = with pkgs;
        [
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
    kernelModules = [ "kvm-amd" "kvm-intel" ];
  };

  networking = {
    hostName = "Bulletstorm";
    networkmanager.enable = true;
  };

  time.timeZone = "Asia/Tbilisi";

  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
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
  };

  services = {
    xserver = {
      enable = true;
      displayManager = {
        gdm.enable = true;
        autoLogin = {
          enable = true;
          user = "nett00n";
        };
      };
      desktopManager.gnome.enable = true;
      xkb = {
        layout = "us";
        variant = "";
      };
      videoDrivers = [ "nvidia" ];
    };
    printing.enable = true;
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
    ollama = {
      enable = true;
      acceleration = "cuda";
    };
  };

  security.rtkit.enable = true;
  hardware.pulseaudio.enable = false;

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

  systemd.services = {
    "getty@tty1".enable = false;
    "autovt@tty1".enable = false;
  };

  programs.firefox = {
    enable = true;
    package = pkgs.firefox;
    nativeMessagingHosts.packages = [ pkgs.firefoxpwa ];
  };

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
    virt-manager
  ];

  system.stateVersion = "24.05";
  hardware.opengl = { enable = true; };
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
    libvirtd.enable = true;
  };

  fileSystems = let
    contentPath = "/media/Content";
    gamesPath = "/media/Games";
  in {
    "/media/Content" = {
      device = "/dev/disk/by-partuuid/7e0d7518-14b6-481c-acae-0499ab73284e";
      fsType = "xfs";
      options = [ "defaults" "nofail" ];
    };
    "/media/Games" = {
      device = "/dev/disk/by-uuid/9a158d69-fb5f-4f72-abd8-1963eedb1bf4";
      fsType = "xfs";
      options = [ "defaults" "nofail" ];
    };
    "/Books" = {
      device = "${contentPath}/Books/";
      options = [ "bind" "nofail" ];
    };
    "/Comics" = {
      device = "${contentPath}/Comics/";
      options = [ "bind" "nofail" ];
    };
    "/Courses" = {
      device = "${contentPath}/Videos/Courses/";
      options = [ "bind" "nofail" ];
    };
    "/Data" = {
      device = "/home/Data";
      options = [ "bind" "nofail" ];
    };
    "/Downloads" = {
      device = "${contentPath}/Downloads/";
      options = [ "bind" "nofail" ];
    };
    "/Games" = {
      device = "${gamesPath}";
      options = [ "bind" "nofail" ];
    };
    "/Series" = {
      device = "${contentPath}/Videos/Series/";
      options = [ "bind" "nofail" ];
    };
    "/Stacks" = {
      device = "/home/Stacks";
      options = [ "bind" "nofail" ];
    };
  };

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;
  };
}
