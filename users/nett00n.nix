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
    dasel
    dmidecode
    gh
    gitlab-ci-local
    glab
    hyfetch
    imagemagick
    junction
    keystore-explorer
    kitty
    ksnip
    libnotify
    libwebp
    nixfmt-classic
    nmap
    pre-commit
    pwgen
    python311Packages.pip
    python311Packages.virtualenv
    starship
    terraform
    tflint
    tmux
    viddy
    whois
    xsel
    yamlfmt
    yamllint
    yt-dlp
  ];
}
