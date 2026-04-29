{pkgs, ...}: {
  home.packages = with pkgs; [
    pfetch-rs # Rewrite of the pfetch system information tool in Rust

    wayland-utils # Wayland utilities
    wl-clipboard-rs # Command-line copy/paste utilities for Wayland
    hunspell # Spell checker
    hunspellDicts.ru_RU
    hunspellDicts.en-us

    # Screen tools
    grim
    slurp
    tesseract
    zbar
    wl-screenrec
    gifski
    translate-shell

    bazaar
  ];
}
