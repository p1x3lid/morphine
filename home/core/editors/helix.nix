{pkgs, ...}: {
  programs.helix.enable = true;

  # See <https://docs.helix-editor.com/configuration.html>
  # for the full list of options.
  programs.helix.settings = {
    theme = "gruvbox";
    editor = {
      line-number = "absolute";
      scroll-lines = 1;
      lsp.display-messages = true;
      file-picker.hidden = false;
      cursor-shape = {
        insert = "bar";
        normal = "block";
        select = "underline";
      };
    };
    keys.normal = {
      space.space = "file_picker";
      space.w = ":w";
      space.q = ":q";
      esc = ["collapse_selection" "keep_primary_selection"];
    };
  };

  # See <https://docs.helix-editor.com/languages.html>
  # for more information.
  programs.helix.languages = {
    language = [
      {
        name = "nix";
        formatter.command = "alejandra";
        auto-format = true;
      }
    ];
  };
}
