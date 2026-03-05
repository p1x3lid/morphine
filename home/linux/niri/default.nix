{pkgs, ...}: {
  imports = [
    ./hypr
    ./waybar

    ./fuzzel.nix
    ./mako.nix
    ./niri.nix
  ];
}
