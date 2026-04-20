{...}: {
  imports = [
    ./shells
    ./editors
    ./terminals

    ./core.nix
    ./cache.nix
    ./starship.nix
    ./yazi.nix
    ./git.nix
    ./zellij.nix
  ];
}
