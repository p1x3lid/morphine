{
  pkgs,
  lib,
  myvars,
  ...
}: {
  imports = [
    ./fonts.nix
    ./nix.nix
    ./packages.nix
  ];
}
