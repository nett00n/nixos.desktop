
{ config, pkgs, ... }: {
  users.users.nett00n.packages = with pkgs; [
    act
    ansible
    awscli2
    btop
    dasel
    dmidecode
    fastfetch
    gh
    gitlab-ci-local
    glab
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
