{pkgs, ...}: {
  security.polkit.enable = true; # polkit
  programs.niri.enable = true;
  security.pam.services.hyprlock = {};

  programs.waybar.enable = true; # top bar
  programs.waybar.systemd.target = "niri-session.target";
  environment.systemPackages = with pkgs; [
    fuzzel
    hyprlock
    hyprpaper
    mako
    xwayland-satellite
    stasis
  ];
}
