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
    awscli2
    conky
    dasel
    dmidecode
    gh
    gitlab-ci-local
    glab
    gnome-tweaks
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
    pre-commit
    pwgen
    python311Packages.pip
    python311Packages.virtualenv
    starship
    tdesktop
    terraform
    tflint
    thunderbird
    tmux
    viddy
    vscode
    whois
    xsel
    yamlfmt
    yamllint
    yt-dlp
  ];
}
