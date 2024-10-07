{ config, pkgs, ... }: {
  users.users.nett00n = {
    isNormalUser = true;
    description = "nett00n";
    extraGroups = [ "docker" "kvm" "networkmanager" "ssh-users" "wheel" "gamemode" "sudo" ];
    uid = 1000;
  };

  users.users.nett00n.packages = with pkgs; [
    nmap
    gnome-tweaks
    pwgen
    python3
    python311Packages.pip
    python311Packages.virtualenv
    whois
    act
    alacritty
    awscli2
    dbeaver-bin
    gh
    glab
    go
    hyfetch
    imagemagick
    junction
    keystore-explorer
    ksnip
    libreoffice
    libwebp
    meld
    nixfmt-classic
    nvtopPackages.full
    obsidian
    ocs-url
    sassc
    slack
    spotdl
    starship
    tdesktop
    terraform
    tflint
    thunderbird
    tmux
    viddy
    vlc
    vscode
    xsel
    yamlfmt
    yamllint
    yt-dlp
    zoom-us
    zoxide
    viddy
    eza
    kitty
  ];
}
