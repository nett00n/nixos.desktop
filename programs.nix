# programs.nix

{ pkgs, ... }: {
  services.flatpak.enable = true;

  # Turn on appimage support
  boot.binfmt.registrations.appimage = {
    wrapInterpreterInShell = false;
    interpreter = "${pkgs.appimage-run}/bin/appimage-run";
    recognitionType = "magic";
    offset = 0;
    mask = "\\xff\\xff\\xff\\xff\\x00\\x00\\x00\\x00\\xff\\xff\\xff";
    magicOrExtension = "\\x7fELF....AI\\x02";
  };
programs.nix-ld.enable = true;

  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    appimage-run
    cudatoolkit
    dig
    distrobox
    fdupes
    firefox-bin
    flatpak
    git
    gnome-software
    gnomeExtensions.alphabetical-app-grid
    gnomeExtensions.blur-my-shell
    gnomeExtensions.clipboard-history
    gnomeExtensions.muteunmute
    gnomeExtensions.quick-settings-audio-panel
    gparted
    mc
    ncdu
    neovim
    nix-index
    nix-ld
    nixpkgs-fmt
    ocs-url
    pciutils
    unzip
    usbutils
    xclip
    xdg-desktop-portal-gtk
    zip
  ];
  # Exclude packages
  environment.gnome.excludePackages = with pkgs; [
    epiphany
    gnome-console
    gnome-tour
    geary
    gnome-backgrounds
    gnome-maps
    gnome-music
  ];

}
