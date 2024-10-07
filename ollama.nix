# ollama.nix

{
  services.ollama = {
    enable = true;
    acceleration = "cuda";
  };
}
