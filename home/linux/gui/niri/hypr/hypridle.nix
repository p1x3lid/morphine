{...}: {
  # Hyprland idle daemon
  services.hypridle.enable = true;

  xdg.configFile."hypr/hypridle.conf".source = ./hypridle.conf;
}
