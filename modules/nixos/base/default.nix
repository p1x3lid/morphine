{...}: {
  imports = [
    ./networking
    ./boot
    ./hardware

    ./i18n.nix
    ./nix.nix
    ./user-group.nix
    ./zram.nix
  ];
}
