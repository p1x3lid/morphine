{pkgs, ...}: {
  # Note that PAM must be configured to enable hyprlock to perform
  # authentication. The package installed through home-manager will *not* be
  # able to unlock the session without this configuration.

  # On NixOS, it can be enabled using:

  # nix
  # security.pam.services.hyprlock = {};

  programs.hyprlock.enable = true;

  xdg.configFile."hypr/hyprlock.conf".source = ./hyprlock.conf;
}
