{hostname, ...}: {
  imports = [
    ./wireless.nix
    ./dns.nix
  ];

  networking.hostName = hostname;
}
