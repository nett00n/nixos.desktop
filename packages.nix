{ config, pkgs, ... }: {
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
  ];
}
