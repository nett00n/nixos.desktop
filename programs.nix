{ config, pkgs, ... }: {
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
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    audacious
    audacious-plugins
    cudaPackages.autoAddOpenGLRunpathHook
    cudatoolkit
    dig
    docker
    git
    gparted
    mc
    ncdu
    neovim
    nix-ld
    nixpkgs-fmt
    nmap
    nvidia-container-toolkit
    pkgs.firefoxpwa
    pwgen
    python3
    python311Packages.pip
    python311Packages.virtualenv
    virt-manager
    whois
    pkgs.gnome3.gnome-tweaks
    zip
    unzip
  ];
  users.users.nett00n.packages = with pkgs; [
    act
    alacritty
    awscli2
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
    ocs-url
    protontricks
    protonup-qt
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
