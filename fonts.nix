# fonts.nix

{ config, pkgs, ... }: {
  fonts.packages = with pkgs; [ fira-code-nerdfont ubuntu_font_family ];
}
