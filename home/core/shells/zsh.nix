{pkgs, ...}: {
  programs.zsh = {
    enable = true;

    initContent = ''
      # Vi key bindings
      bindkey -v
      KEYTIMEOUT=1

      # Cursor shape: line in insert, block in normal
      function zle-keymap-select {
        if [[ $KEYMAP == vicmd ]]; then
          echo -ne '\e[2 q'
        else
          echo -ne '\e[6 q'
        fi
      }
      function zle-line-init {
        echo -ne '\e[6 q'
      }
      zle -N zle-keymap-select
      zle -N zle-line-init

      pfetch
    '';

    plugins = [
      {
        name = "zsh-autosuggestions";
        src = "${pkgs.zsh-autosuggestions}/share/zsh-autosuggestions";
        file = "zsh-autosuggestions.zsh";
      }
      {
        name = "zsh-syntax-highlighting";
        src = "${pkgs.zsh-syntax-highlighting}/share/zsh-syntax-highlighting";
        file = "zsh-syntax-highlighting.zsh";
      }
      {
        name = "grc";
        src = "${pkgs.grc}/etc";
        file = "grc.zsh";
      }
    ];

    shellAliases = {
      # Git
      lg = "lazygit";
      g = "git";
      gs = "git status";
      ga = "git add";
      gc = "git commit";
      gp = "git push";
      gl = "git log --oneline --graph --decorate";

      # Replace cd with zoxide
      cd = "z";

      # Common use
      tarnow = "tar -acf ";
      untar = "tar -zxvf ";
      wget = "wget -c ";
      psmem = "ps auxf | sort -nr -k 4 ";
      psmem10 = "ps auxf | sort -nr -k 4 | head -10 ";
      psg = "ps aux | grep -v grep | grep ";
      md = "mkdir -p ";
      t = "touch ";
      q = "exit";
      dfh = "df -h";
      duh = "du -h -d1";
      free = "free -h";
      n = "nvim";
      jctl = "journalctl -p 3 -xb";

      # Nix
      ns = "nix search nixpkgs";
      nr = "nix run nixpkgs#";
      nd = "nix develop";
      nb = "nix build";
    };
  };

  home.shell.enableZshIntegration = true;
}
