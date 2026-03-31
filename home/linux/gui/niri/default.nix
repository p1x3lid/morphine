{pkgs, ...}: {
  imports = [
    ./hypr
    ./noctalia

    ./niri.nix
  ];
}
