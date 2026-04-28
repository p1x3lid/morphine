{
  pkgs,
  config,
  lib,
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

    # Tools
    "EDITOR" = "nvim";
    "VISUAL" = "nvim";
    "PAGER" = "bat --paging=always";
    "PF_INFO" = "ascii title os kernel uptime pkgs memory";

    # misc
    "_JAVA_AWT_WM_NONREPARENTING" = "1";
    "QT_WAYLAND_DISABLE_WINDOWDECORATION" = "1";
    "SDL_VIDEODRIVER" = "wayland";
    "GDK_BACKEND" = "wayland";
    "XDG_SESSION_TYPE" = "wayland";
    "QT_QPA_PLATFORMTHEME" = lib.mkForce "qt6ct";
    "QS_ICON_THEME" = "qt6ct";
    "SSH_AUTH_SOCK" = "$HOME/.bitwarden-ssh-agent.sock";
    # Point gsettings to the compiled schemas
    "GSETTINGS_SCHEMA_DIR" = "${pkgs.gsettings-desktop-schemas}/share/gsettings-schemas/${pkgs.gsettings-desktop-schemas.name}/glib-2.0/schemas";
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
  gtk = {
    enable = true;
    colorScheme = "dark";
    iconTheme = {
      package = pkgs.papirus-icon-theme;
      name = "Papirus";
    };
    cursorTheme = {
      package = pkgs.apple-cursor;
      name = "macOS";
      size = 36;
    };

    gtk2.configLocation = "${config.xdg.configHome}/gtk-2.0/gtkrc";
    gtk3.extraConfig.gtk-application-prefer-dark-theme = 1;
    gtk4.extraConfig.gtk-application-prefer-dark-theme = 1;
  };

  qt = {
    enable = true;
    platformTheme.name = "qtct";
    style.name = "breeze";
  };

  qt.qt5ctSettings = {
    Appearance = {
      style = "breeze";
      icon_theme = "Papirus";
    };
  };

  qt.qt6ctSettings = {
    Appearance = {
      style = "breeze";
      icon_theme = "Papirus";
    };
  };
}
