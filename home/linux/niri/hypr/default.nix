{pkgs, ...}: {
  imports = [
    ./hyprlock.nix
    ./hyprpaper.nix
    ./hypridle.nix
  ];

  home.packages = with pkgs; [
    hyprlock
    hyprpaper
    hypridle
  ];
}
