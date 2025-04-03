{ pkgs, ... }: {

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };
  environment.systemPackages = with pkgs; [
    brightnessctl
    hyprcursor
    hypridle
    hyprland-per-window-layout
    hyprlock
    hyprpaper
    hyprshot
    swaynotificationcenter
    waybar
    wofi
  ];
}
