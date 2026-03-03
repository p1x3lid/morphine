{
  config,
  lib,
  pkgs,
  modulesPath,
  ...
}: {
  imports = [
    ./hardware.nix
    ./filesystems.nix
    ./zram-swap.nix
  ];
}
