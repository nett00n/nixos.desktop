{ config, pkgs, ... }: {
  users.users.nett00n = {
    isNormalUser = true;
    description = "nett00n";
    extraGroups = [ "networkmanager" "wheel" "docker" ];
    packages = with pkgs; [
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
  };
  services.xserver.displayManager.autoLogin = {
    enable = true;
    user = "nett00n";
  };
}
