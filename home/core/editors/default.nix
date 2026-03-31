{
  pkgs,
  config,
  ...
}: {
  imports = [
    ./helix.nix
    ./neovim.nix
  ];
}
