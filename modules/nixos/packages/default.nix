{
  inputs,
  pkgs,
  lib,
  ...
}: {
  imports = [
    ./programs.nix
    ./packages.nix
    ./fonts.nix
    ./niri.nix
    ./de.nix
    ./dm.nix
  ];
}
