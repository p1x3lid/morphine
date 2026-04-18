{ ... }:
{
  programs.bash = {
    enable = true;

    initExtra = ''
      # Vi key bindings
      set -o vi
      bind "set keyseq-timeout 1"

      # Cursor shape: line in insert, block in normal
      bind 'set show-mode-in-prompt on'
      function set-cursor-for-mode() {
        if [[ $1 == "vicmd" ]]; then
          echo -ne '\e[2 q'
        else
          echo -ne '\e[6 q'
        fi
      }
      bind -x '"\e[?": "set-cursor-for-mode vicmd"'
      echo -ne '\e[6 q'

      pfetch
    '';

    shellAliases = {
      lg = "lazygit";
      g = "git";
      gs = "git status";
      ga = "git add";
      gc = "git commit";
      gp = "git push";
      gl = "git log --oneline --graph --decorate";
      cd = "z";
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
      ns = "nix search nixpkgs";
      nr = "nix run nixpkgs#";
      nd = "nix develop";
      nb = "nix build";
    };
  };
}
