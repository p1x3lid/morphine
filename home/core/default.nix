{...}: {
  imports = [
    ./shells
    ./editors
    ./terminals

    ./core.nix
    ./starship.nix
    ./yazi.nix
    ./git.nix
    ./zellij.nix
  ];
}
