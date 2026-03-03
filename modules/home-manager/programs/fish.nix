{pkgs, ...}: {
  programs.fish = {
    enable = true;

    interactiveShellInit = ''
      set fish_greeting # Disable greeting
      pfetch
    '';

    plugins = [
      # Enable a plugin (here grc for colorized command output) from nixpkgs
      {
        name = "grc";
        src = pkgs.fishPlugins.grc.src;
      }
      {
        name = "hydro";
        src = pkgs.fishPlugins.hydro.src;
      }
      {
        name = "fish-you-should-use";
        src = pkgs.fishPlugins.fish-you-should-use.src;
      }
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

      # Replace ls with lsd
      ls = "lsd -A --color=always --group-directories-first --icon always"; # preferred listing
      la = "lsd -a --color=always --group-directories-first --icon always"; # all files and dirs
      ll = "lsd -al --color=always --group-directories-first --icon always"; # long format
      lt = "lsd --tree --color=always --group-directories-first --icon always"; # tree listing

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

      # Get the error messages from journalctl
      jctl = "journalctl -p 3 -xb";

      # Nix
      ns = "nix search nixpkgs";
      nr = "nix run nixpkgs#";
      nd = "nix develop";
      nb = "nix build";
    };
  };
}
