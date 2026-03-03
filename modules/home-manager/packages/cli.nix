{pkgs, ...}: {
  # CLI / dev / TUI tools used by the user
  home.packages = with pkgs; [
    # dev toolchain / formatters / lang
    gcc # GNU Compiler Collection
    nodejs
    python3 # High-level dynamically-typed programming language
    ruff # Extremely fast Python linter and code formatter
    uv # Extremely fast Python package installer and resolver, written in Rust
    rustup # Rust toolchain installer
    bash-language-server # Language server for Bash
    fish-lsp # LSP implementation for the fish shell language
    clang-tools # Standalone command line tools for C++ development
    lldb # Next-generation high-performance debugger
    marksman # Language Server for Markdown
    jq-lsp # jq language server
    typescript-language-server # Language Server Protocol implementation for TypeScript using tsserver
    vscode-langservers-extracted # HTML/CSS/JSON/ESLint language servers extracted from vscode
    nil # Yet another language server for Nix
    alejandra # Nix formatter
    taplo # TOML toolkit written in Rust

    # shell + helpers
    carapace # Multi-shell multi-command argument completer
    atuin # Replacement for a shell history which records additional commands context with optional encrypted synchronization between machines
    zoxide # Fast cd command that learns your habits
    pfetch-rs # Rewrite of the pfetch system information tool in Rust

    # utils
    curl
    wget
    ripgrep
    fd
    fzf
    jq
    unzip
    imagemagick
    lsd
    btop
    bat
    tealdeer
    chezmoi
    trashy
    grc # Generic text coloriser
    wayland-utils # Wayland utilities
    wl-clipboard-rs # Command-line copy/paste utilities for Wayland
    hunspell # Spell checker
    hunspellDicts.ru_RU
    hunspellDicts.en-us

    # TUI / small interactive tools
    lazygit
    impala
    bluetui
    wiremix
  ];
}
