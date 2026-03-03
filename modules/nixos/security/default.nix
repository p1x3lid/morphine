{
  pkgs,
  config,
  lib,
  ...
}: {
  imports = [
    ./security.nix
    ./root.nix
    ./firewall.nix
  ];
}
