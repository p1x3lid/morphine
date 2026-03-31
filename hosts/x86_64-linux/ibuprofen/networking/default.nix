{myvars, ...}: {
  imports = [
    ./avahi.nix
    ./firewall.nix
    ./misc.nix
    ./throne.nix
    ./iwd.nix
  ];

  networking.hostName = myvars.hostName;
}
