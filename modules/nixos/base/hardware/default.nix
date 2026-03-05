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
  ];
}
