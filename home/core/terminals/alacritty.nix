{...}: {
  programs.alacritty = {
    # enable = true;

    settings = {
      env.TERM = "xterm-256color";
      font = {
        normal = {
          family = "MesloLGM Nerd Font";
          style = "Regular";
        };

        bold = {
          family = "MesloLGM Nerd Font";
          style = "Bold";
        };

        italic = {
          family = "MesloLGM Nerd Font";
          style = "Italic";
        };

        size = 12.0;
      };

      window = {
        dimensions = {
          lines = 27;
          columns = 110;
        };

        padding = {
          x = 14;
          y = 14;
        };

        decorations = "Full";
      };

      keyboard.bindings = [
        {
          key = "Insert";
          mods = "Shift";
          action = "Paste";
        }

        {
          key = "Insert";
          mods = "Control";
          action = "Copy";
        }
      ];
    };

    theme = "gruvbox_material_hard_dark";
  };
}
