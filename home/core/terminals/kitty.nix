{...}: {
  programs.kitty = {
    enable = true;

    shellIntegration = {
      enableBashIntegration = true;
      enableFishIntegration = true;
    };

    settings = {
      scrollback_lines = 1000;
      enable_audio_bell = false;
      update_check_interval = 0;

      font_size = 13.0;

      cursor_trail = 2;
      cursor_trail_decay = "0.1 0.4";
      allow_remote_control = "no";
    };

    font.name = "Meslo LGM Nerd Font";
    themeFile = "GruvboxMaterialDarkHard";
  };
}
