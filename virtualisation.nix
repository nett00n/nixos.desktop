# virtualisation.nix

{
  virtualisation = {
    docker = { enable = true; };
    libvirtd.enable = true;
  };
}
