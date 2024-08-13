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
    cudaPackages.autoAddOpenGLRunpathHook
    cudatoolkit
    dig
    docker
    git
    gparted
    mc
    neovim
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
    ncdu
    nix-ld
    fuse
    glib
  ];
  users.users.nett00n.packages = with pkgs; [
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
    protontricks
    protonup-qt
    slack
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
    yt-dlp
    zed-editor
    zoom-us
  ];
  # Exclude packages
  environment.gnome.excludePackages = (with pkgs;
    [
    ]);
}
