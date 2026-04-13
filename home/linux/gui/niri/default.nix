{pkgs, ...}: {
  imports = [
    ./hypr

    ./niri.nix
    ./noctalia.nix
  ];
}
