{
  pkgs,
  lib,
  ...
}: {
  # home.packages = with pkgs; [
  #   #niri
  #   niri
  #   # Niri v25.08 will create X11 sockets on disk, export $DISPLAY, and spawn `xwayland-satellite` on-demand when an X11 client connects
  #   xwayland-satellite
  # ];
  #
  # xdg.configFile = {
  #   "niri/config.kdl".source = ./niri-conf/config.kdl;
  #   "niri/keybindings.kdl".source = ./niri-conf/keybindings.kdl;
  #   "niri/windowrules.kdl".source = ./niri-conf/windowrules.kdl;
  # };
  #
  # systemd.user.services.niri-flake-polkit = {
  #   Unit = {
  #     Description = "PolicyKit Authentication Agent provided by niri-flake";
  #     After = [
  #       "graphical-session.target"
  #     ];
  #     Wants = ["graphical-session-pre.target"];
  #   };
  #   Install.WantedBy = ["niri.service"];
  #   Service = {
  #     Type = "simple";
  #     ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
  #     Restart = "on-failure";
  #     RestartSec = 1;
  #     TimeoutStopSec = 10;
  #   };
  # };
  #
  # # NOTE: this executable is used by greetd to start a wayland session when system boot up
  # # with such a vendor-no-locking script, we can switch to another wayland compositor without modifying greetd's config in NixOS module
  # home.file.".wayland-session" = {
  #   source = pkgs.writeScript "init-session" ''
  #     # trying to stop a previous niri session
  #     systemctl --user is-active niri.service && systemctl --user stop niri.service
  #     # and then we start a new one
  #     /run/current-system/sw/bin/niri-session
  #   '';
  #   executable = true;
  # };
  programs.niri.settings.input = {
    keyboard.xkb.layout = "us,ru";
    keyboard.xkb.options = "grp:caps_toggle,compose:ralt";

    touchpad.dwt = true;
    touchpad.natural-scroll = true;
  };

  programs.niri.settings.cursor.theme = "macOS";
  programs.niri.settings.cursor.size = 36;
  programs.niri.settings.prefer-no-csd = true;

  programs.niri.settings.binds = {
    "Mod+Shift+Slash".action.spawn = ["noctalia-shell" "ipc" "call" "plugin" "togglePanel" "keybind-cheatsheet"];

    # Launcher
    "Mod+D".action.spawn = ["noctalia-shell" "ipc" "call" "launcher" "toggle"];
    "Mod+Space".action.spawn = ["noctalia-shell" "ipc" "call" "launcher" "toggle"];
    "XF86Search".action.spawn = ["noctalia-shell" "ipc" "call" "launcher" "toggle"];

    # programs
    "Mod+Return".action.spawn = "kitty";
    "Mod+Shift+Return".action.spawn = "foot";
    "Mod+Escape".action.spawn = ["noctalia-shell" "ipc" "call" "lockScreen" "lock"];

    # Volume
    "XF86AudioRaiseVolume".action.spawn = ["noctalia-shell" "ipc" "call" "volume" "increase"];
    "XF86AudioLowerVolume".action.spawn = ["noctalia-shell" "ipc" "call" "volume" "decrease"];
    "XF86AudioMute".action.spawn = ["noctalia-shell" "ipc" "call" "volume" "muteOutput"];
    "XF86AudioMicMute".action.spawn = ["noctalia-shell" "ipc" "call" "volume" "muteInput"];

    # Mediakeys
    "XF86AudioPlay".action.spawn = ["noctalia-shell" "ipc" "call" "media" "playPause"];
    "XF86AudioStop".action.spawn = ["noctalia-shell" "ipc" "call" "media" "pause"];
    "XF86AudioPrev".action.spawn = ["noctalia-shell" "ipc" "call" "media" "previous"];
    "XF86AudioNext".action.spawn = ["noctalia-shell" "ipc" "call" "media" "next"];

    # Brightness
    "XF86MonBrightnessUp".action.spawn = ["noctalia-shell" "ipc" "call" "brightness" "increase"];
    "XF86MonBrightnessDown".action.spawn = ["noctalia-shell" "ipc" "call" "brightness" "decrease"];

    "Mod+O".action.toggle-overview = [];
    "Mod+Q".action.close-window = [];

    ### Navigation
    # Focus
    "Mod+H".action.focus-column-left = [];
    "Mod+J".action.focus-window-down = [];
    "Mod+K".action.focus-window-up = [];
    "Mod+L".action.focus-column-right = [];
    "Mod+Home".action.focus-column-first = [];
    "Mod+End".action.focus-column-last = [];
    # Focus different monitor
    "Mod+Shift+H".action.focus-monitor-left = [];
    "Mod+Shift+J".action.focus-monitor-down = [];
    "Mod+Shift+K".action.focus-monitor-up = [];
    "Mod+Shift+L".action.focus-monitor-right = [];
    # Move
    "Mod+Ctrl+H".action.move-column-left = [];
    "Mod+Ctrl+J".action.move-window-down = [];
    "Mod+Ctrl+K".action.move-window-up = [];
    "Mod+Ctrl+L".action.move-column-right = [];
    "Mod+Ctrl+Home".action.move-column-to-first = [];
    "Mod+Ctrl+End".action.move-column-to-last = [];
    # Workspaces
    "Mod+1".action.focus-workspace = 1;
    "Mod+2".action.focus-workspace = 2;
    "Mod+3".action.focus-workspace = 3;
    "Mod+4".action.focus-workspace = 4;
    "Mod+5".action.focus-workspace = 5;
    "Mod+6".action.focus-workspace = 6;
    "Mod+7".action.focus-workspace = 7;
    "Mod+8".action.focus-workspace = 8;
    "Mod+9".action.focus-workspace = 9;
    # Move to workspace
    "Mod+Ctrl+1".action.move-column-to-workspace = 1;
    "Mod+Ctrl+2".action.move-column-to-workspace = 2;
    "Mod+Ctrl+3".action.move-column-to-workspace = 3;
    "Mod+Ctrl+4".action.move-column-to-workspace = 4;
    "Mod+Ctrl+5".action.move-column-to-workspace = 5;
    "Mod+Ctrl+6".action.move-column-to-workspace = 6;
    "Mod+Ctrl+7".action.move-column-to-workspace = 7;
    "Mod+Ctrl+8".action.move-column-to-workspace = 8;
    "Mod+Ctrl+9".action.move-column-to-workspace = 9;
    # Size
    "Mod+BracketLeft".action.consume-or-expel-window-left = [];
    "Mod+BracketRight".action.consume-or-expel-window-right = [];
    "Mod+Comma".action.consume-window-into-column = [];
    "Mod+Period".action.expel-window-from-column = [];
    "Mod+R".action.switch-preset-window-width = [];
    "Mod+Shift+R".action.switch-preset-window-height = [];
    "Mod+F".action.maximize-column = [];
    "Mod+Shift+F".action.fullscreen-window = [];
    # "Mod+Minus".action.set-column-width = "-10%";
    # "Mod+Equal".action.set-column-width = "+10%";
    # "Mod+Shift+Minus".action.set-column-height = "-10%";
    # "Mod+Shift+Equal".action.set-column-height = "+10%";
    # Floating
    "Mod+V".action.toggle-window-floating = [];
    "Mod+Shift+V".action.switch-focus-between-floating-and-tiling = [];

    # Toggle tabbed column display mode
    "Mod+W".action.toggle-column-tabbed-display = [];

    "Mod+Shift+P".action.power-off-monitors = [];
    "Mod+Shift+E".action.quit = [];
    "Mod+Shift+Print".action.screenshot-screen = {show-pointer = false;};
  };

  programs.niri.settings.xwayland-satellite.enable = true;
  programs.niri.settings.xwayland-satellite.path = lib.getExe pkgs.xwayland-satellite;

  programs.niri.settings.spawn-at-startup = [
    {
      command = [
        "noctalia-shell"
      ];
    }
  ];
}
