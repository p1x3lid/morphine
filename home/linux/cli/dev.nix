{pkgs, ...}: {
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
  ];
}
