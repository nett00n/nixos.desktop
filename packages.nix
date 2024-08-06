{ config, pkgs, ... }: {
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    cudaPackages.autoAddOpenGLRunpathHook
    cudatoolkit
    docker
    git
    gparted
    mc
    neovim
    nixpkgs-fmt
    nvidia-container-toolkit
    pkgs.firefoxpwa
    python3
    python311Packages.pip
    python311Packages.virtualenv
    virt-manager
  ];
}
