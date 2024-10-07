# gaming.nix

{
  programs.steam = {
    enable = true;
    remotePlay.openFirewall =
      true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall =
      true; # Open ports in the firewall for Source Dedicated Server
    localNetworkGameTransfers.openFirewall =
      true; # Open ports in the firewall for Steam Local Network Game Transfers
  };
  programs.steam.gamescopeSession.enable = true;
  programs.java.enable = true;
  environment.systemPackages = with pkgs; [ lutris mangohud protonup-qt ];
  programs.gamemode.enable = true;
}
