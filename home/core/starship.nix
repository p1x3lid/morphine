{
  programs.starship = {
    enable = true;

    enableBashIntegration = true;
    enableZshIntegration = true;
    enableFishIntegration = true;
    enableNushellIntegration = true;

    # https://starship.rs/config/
    settings = {
      # Get editor completions based on the config schema
      "$schema" = "https://starship.rs/config-schema.json";

      character = {
        success_symbol = "[➜](bold green)";
        error_symbol = "[✗](bold red)";

        # fish vi mode
        vimcmd_symbol = "[N](bold yellow)";
        vimcmd_visual_symbol = "[V](bold magenta)";
        vimcmd_replace_symbol = "[R](bold red)";
        vimcmd_replace_one_symbol = "[r](bold red)";
      };
    };
  };
}
