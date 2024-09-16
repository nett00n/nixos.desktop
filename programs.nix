{ config, pkgs, ... }: {
  services.flatpak.enable = true;
  programs.nix-ld.enable = true;

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
    firefox-bin
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
    pciutils
    pkgs.gnome3.gnome-tweaks
    pwgen
    python3
    python311Packages.pip
    python311Packages.virtualenv
    unzip
    usbutils
    virt-manager
    whois
    xdg-desktop-portal-gtk
    zip
  ];
  users.users.nett00n.packages = with pkgs; [
    act
    alacritty
    awscli2
    dbeaver-bin
    faba-mono-icons
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
    meld
    nixfmt-classic
    nvtopPackages.full
    obsidian
    ocs-url
    rose-pine-cursor
    sassc
    slack
    spotdl
    starship
    tdesktop
    terraform
    tflint
    thunderbird
    tmux
    vlc
    vscode
    xsel
    yamlfmt
    yamllint
    yt-dlp
    zoom-us
    mangohud
  ];
  # Exclude packages
  environment.gnome.excludePackages = with pkgs; [
    epiphany
    gnome-console
    gnome-tour
    gnome.geary
    gnome.gnome-backgrounds
    gnome.gnome-maps
    gnome.gnome-music
  ];

}
