{pkgs, ...}: {
  services.hyprpaper.enable = true;

  xdg.configFile."hypr/hyprpaper.conf".source = ./hyprpaper.conf;
}
