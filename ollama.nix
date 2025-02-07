# ollama.nix

{
  services.ollama = {
    enable = true;
    acceleration = "cuda";
    loadModels = [ "llama3.1" "llama3.3" "mistral" "deepseek-r1:14b" ];
  };
  services.open-webui = {
    enable = true;
    host = "0.0.0.0";
    port = 8081;
    openFirewall = true;
  };
}
