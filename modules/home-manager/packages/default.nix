{
  pkgs,
  config,
  ...
}: {
  imports = [
    ./cli.nix
    ./gui.nix
  ];
}
