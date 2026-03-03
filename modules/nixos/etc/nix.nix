{...}: {
  nix = {
    # Collect garbage every week
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };

    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      extra-experimental-features = "parallel-eval";
      # enable lazy-trees from determinate Nix
      lazy-trees = true;
      eval-cores = 0; # Evaluate across all cores
    };
  };
}
