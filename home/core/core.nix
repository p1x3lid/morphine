{pkgs, ...}: {
  # CLI / dev / TUI tools used by the user
  home.packages = with pkgs; [
    # nix related
    #
    # it provides the command `nom` works just like `nix
    # with more details log output
    nix-output-monitor
    hydra-check # check hydra(nix's build farm) for the build status of a package
    nix-index # A small utility to index nix store paths
    nix-init # generate nix derivation from url
    # https://github.com/nix-community/nix-melt
    nix-melt # A TUI flake.lock viewer
    # https://github.com/utdemir/nix-tree
    nix-tree # A TUI to visualize the dependency graph of a nix derivation

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

    # utils
    curl
    wget
    ripgrep
    fd
    jq
    unzip
    imagemagick
    btop
    chezmoi
    trashy
    grc # Generic text coloriser

    # misc
    # A fast and polyglot tool for code searching, linting, rewriting at large scale
    # supported languages: only some mainstream languages currently(do not support nix/nginx/yaml/toml/...)
    ast-grep
  ];

  # A modern replacement for ‘ls’
  # useful in fish/bash prompt, not in nushell.
  programs.lsd = {
    enable = true;
    # do not enable aliases in nushell!
    enableBashIntegration = true;
    enableFishIntegration = true;
  };

  # a cat(1) clone with syntax highlighting and Git integration.
  programs.bat = {
    enable = true;
    config = {
      pager = "less -FR";
    };
  };

  # A command-line fuzzy finder
  programs.fzf.enable = true;

  # very fast version of tldr in Rust
  programs.tealdeer = {
    enable = true;
    enableAutoUpdates = true;
    settings = {
      display = {
        compact = false;
        use_pager = true;
      };
      updates = {
        auto_update = false;
        auto_update_interval_hours = 720;
      };
    };
  };

  # zoxide is a smarter cd command, inspired by z and autojump.
  # It remembers which directories you use most frequently,
  # so you can "jump" to them in just a few keystrokes.
  # zoxide works on all major shells.
  #
  #   z foo              # cd into highest ranked directory matching foo
  #   z foo bar          # cd into highest ranked directory matching foo and bar
  #   z foo /            # cd into a subdirectory starting with foo
  #
  #   z ~/foo            # z also works like a regular cd command
  #   z foo/             # cd into relative path
  #   z ..               # cd one level up
  #   z -                # cd into previous directory
  #
  #   zi foo             # cd with interactive selection (using fzf)
  #
  #   z foo<SPACE><TAB>  # show interactive completions (zoxide v0.8.0+, bash 4.4+/fish/zsh only)
  programs.zoxide = {
    enable = true;
    enableBashIntegration = true;
    enableFishIntegration = true;
    enableNushellIntegration = true;
  };

  # Atuin replaces your existing shell history with a SQLite database,
  # and records additional context for your commands.
  # Additionally, it provides optional and fully encrypted
  # synchronisation of your history between machines, via an Atuin server.
  programs.atuin = {
    enable = true;
    enableBashIntegration = true;
    enableFishIntegration = true;
    enableNushellIntegration = true;
  };

  # Carapace, a multi-shell multi-command argument completer.
  programs.carapace = {
    enable = true;
    enableBashIntegration = true;
    enableFishIntegration = true;
    enableNushellIntegration = true;
  };
}
