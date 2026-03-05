{
  pkgs,
  config,
  ...
}: {
  ### Variables
  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/pixel/etc/profile.d/hm-session-vars.sh
  home.sessionVariables = {
    "NIXOS_OZONE_WL" = "1"; # for any ozone-based browser & electron apps to run on wayland
    "MOZ_ENABLE_WAYLAND" = "1"; # for firefox to run on wayland
    "MOZ_WEBRENDER" = "1";
    # enable native Wayland support for most Electron apps
    "ELECTRON_OZONE_PLATFORM_HINT" = "auto";

    # Tools
    "EDITOR" = "hx";
    "VISUAL" = "hx";
    "PAGER" = "bat --paging=always";
    "PF_INFO" = "ascii title os kernel uptime pkgs memory";

    # misc
    "_JAVA_AWT_WM_NONREPARENTING" = "1";
    "QT_WAYLAND_DISABLE_WINDOWDECORATION" = "1";
    "QT_QPA_PLATFORM" = "wayland";
    "SDL_VIDEODRIVER" = "wayland";
    "GDK_BACKEND" = "wayland";
    "XDG_SESSION_TYPE" = "wayland";
    "XDG_CURRENT_DESKTOP" = "kde";
    "SSH_AUTH_SOCK" = "$HOME/.bitwarden-ssh-agent.sock";
  };

  # If your themes for mouse cursor, icons or windows don’t load correctly,
  # try setting them with home.pointerCursor and gtk.theme,
  # which enable a bunch of compatibility options that should make the themes load in all situations.

  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;
    package = pkgs.apple-cursor;
    name = "macOS";
    size = 36;
  };

  # # set dpi for 4k monitor
  # xresources.properties = {
  #   # dpi for Xorg's font
  #   "Xft.dpi" = 150;
  #   # or set a generic dpi
  #   "*.dpi" = 150;
  # };

  # gtk's theme settings, generate files:
  #   1. ~/.gtkrc-2.0
  #   2. ~/.config/gtk-3.0/settings.ini
  #   3. ~/.config/gtk-4.0/settings.ini
  # gtk = {
  # enable = true;
  # colorScheme = "dark";

  # gtk2.configLocation = "${config.xdg.configHome}/gtk-2.0/gtkrc";
  # };

  # qt = {
  # enable = true;
  # platformTheme.name = "kde";
  # style.name = "breeze";
  # };
}
