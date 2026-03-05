{
  pkgs,
  config,
  ...
}: {
  imports = [
    ./fish.nix
    ./nushell.nix
  ];
}
