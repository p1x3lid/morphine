{pkgs, ...}: {
  # all fonts are linked to /nix/var/nix/profiles/system/sw/share/X11/fonts
  fonts = {
    enableDefaultPackages = true;
    fontDir.enable = true;

    # fonts are defined in /modules/base/fonts.nix, used by both NixOS & Darwin.
    # packages = [ ... ];

    fontconfig = {
      enable = true;
      # User defined default fonts
      # https://catcat.cc/post/2021-03-07/
      defaultFonts = {
        serif = [
          "Noto Serif"
          "Source Sans"
        ];
        sansSerif = [
          "Noto Sans"
          "Source Sans"
        ];
        monospace = [
          "Noto Sans Mono"
          "MesloLGM Nerd Font"
          "JetBrainsMono Nerd Font"
        ];
        emoji = [
          "Noto Color Emoji"
        ];
      };
      antialias = true;
      hinting.enable = false;
      subpixel = {
        rgba = "rgb";
      };
    };
  };

  # https://wiki.archlinux.org/title/KMSCON
  services.kmscon = {
    # Use kmscon as the virtual console instead of gettys.
    # kmscon is a kms/dri-based userspace virtual terminal implementation.
    # It supports a richer feature set than the standard linux console VT,
    # including full unicode support, and when the video card supports drm should be much faster.
    enable = true;
    fonts = with pkgs; [
      {
        name = "MesloLGM Nerd Font";
        package = nerd-fonts.meslo-lg;
      }
      {
        name = "JetBrainsMono Nerd Font";
        package = nerd-fonts.jetbrains-mono;
      }
    ];
    extraOptions = "--term xterm-256color";
    extraConfig = "font-size=14";
    # Whether to use 3D hardware acceleration to render the console.
    hwRender = true;
  };
}
