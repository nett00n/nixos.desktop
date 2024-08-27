{ config, pkgs, ... }: {
  services.flatpak.enable = true;
  programs.nix-ld.enable = true;

  programs.firefox = {
    enable = true;
    package = pkgs.firefox;
    nativeMessagingHosts.packages = [ pkgs.firefoxpwa ];
  };

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;
  };

  # Turn on appimage support
  boot.binfmt.registrations.appimage = {
    wrapInterpreterInShell = false;
    interpreter = "${pkgs.appimage-run}/bin/appimage-run";
    recognitionType = "magic";
    offset = 0;
    mask = "\\xff\\xff\\xff\\xff\\x00\\x00\\x00\\x00\\xff\\xff\\xff";
    magicOrExtension = "\\x7fELF....AI\\x02";
  };

  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    appimage-run
    cudaPackages.autoAddOpenGLRunpathHook
    cudatoolkit
    dig
    docker
    flatpak
    git
    gnome.gnome-software
    gparted
    mc
    ncdu
    neovim
    nix-index
    nix-ld
    nixpkgs-fmt
    nmap
    nvidia-container-toolkit
    pkgs.firefoxpwa
    pkgs.gnome3.gnome-tweaks
    pwgen
    python3
    python311Packages.pip
    python311Packages.virtualenv
    unzip
    virt-manager
    whois
    zip
  ];
  users.users.nett00n.packages = with pkgs; [
    act
    alacritty
    amberol
    awscli2
    dbeaver-bin
    flameshot
    gh
    glab
    go
    hyfetch
    imagemagick
    junction
    keystore-explorer
    libreoffice
    libwebp
    lutris
    meld
    nixfmt-classic
    nvtopPackages.full
    obsidian
    ocs-url
    sassc
    slack
    spotdl
    starship
    steamPackages.steam
    steamPackages.steam-runtime
    steamPackages.steamcmd
    tdesktop
    terraform
    thunderbird
    tmux
    vlc
    vscode
    xsel
    yt-dlp
    zed-editor
    zoom-us
  ];
  # Exclude packages
  environment.gnome.excludePackages = (with pkgs; [ ]);
}
