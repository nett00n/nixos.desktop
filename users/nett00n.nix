# nett00n.nix

{ config, pkgs, ... }: {
  users.users.nett00n = {
    isNormalUser = true;
    description = "nett00n";
    extraGroups =
      [ "docker" "kvm" "networkmanager" "ssh-users" "wheel" "gamemode" "sudo" ];
    uid = 1000;
  };

  users.users.nett00n.packages = with pkgs; [
    act
    alacritty
    awscli2
    conky
    dasel
    dbeaver-bin
    dmidecode
    eza
    gh
    glab
    gnome.gnome-tweaks
    go
    hyfetch
    imagemagick
    junction
    keystore-explorer
    kitty
    ksnip
    libnotify
    libwebp
    localsend
    meld
    nixfmt-classic
    nmap
    nvtopPackages.full
    obsidian
    ocs-url
    onlyoffice-bin
    pre-commit
    pwgen
    python311Packages.virtualenv
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
    whois
    xsel
    yamlfmt
    yamllint
    yazi
    yt-dlp
    zoom-us
    zoxide
  ];
}
