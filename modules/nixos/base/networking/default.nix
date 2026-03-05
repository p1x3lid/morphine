{
  pkgs,
  myvars,
  config,
  lib,
  ...
}: {
  imports = [
    ./avahi.nix
    ./firewall.nix
    ./misc.nix
    ./throne.nix
    ./iwd.nix
  ];
}
