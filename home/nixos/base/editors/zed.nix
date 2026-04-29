{...}: {
  programs.zed-editor.enable = true; # Enbale zed editor

  programs.zed-editor.extensions = [
    "nix"
    "toml"
  ];
}
