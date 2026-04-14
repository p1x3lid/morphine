{pkgs, ...}: {
  programs.fish = {
    enable = true;

    interactiveShellInit = ''
          set fish_greeting # Disable greeting
          fish_vi_key_bindings
      set -g fish_vi_force_cursor 1
      set fish_cursor_insert line
      set fish_cursor_default block
          pfetch
    '';

    plugins = [
      # Enable a plugin (here grc for colorized command output) from nixpkgs
      {
        name = "grc";
        src = pkgs.fishPlugins.grc.src;
      }
      # {
      #   name = "hydro";
      #   src = pkgs.fishPlugins.hydro.src;
      # }
      {
        name = "bass";
        src = pkgs.fishPlugins.bass.src;
      }
      {
        name = "puffer";
        src = pkgs.fishPlugins.puffer.src;
      }
      # {
      # name = "transient-fish";
      # src = pkgs.fishPlugins.transient-fish.src;
      # }
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

      # Get the error messages from journalctl
      jctl = "journalctl -p 3 -xb";

      # Nix
      ns = "nix search nixpkgs";
      nr = "nix run nixpkgs#";
      nd = "nix develop";
      nb = "nix build";
    };
  };

  home.shell.enableFishIntegration = true;
}
