{...}: {
  services.firewalld.enable = true;
  networking.nftables.enable = true;

  networking.firewall = {
    backend = "firewalld";
    enable = true;

    allowPing = false;

    allowedTCPPorts = [
      4460 # NTS-KE
      62576 # qBittorent
      53317 # LocalSend
    ];
    allowedTCPPortRanges = [
      {
        from = 1714; # KDE connect
        to = 1764; # KDE connect
      }
    ];

    allowedUDPPorts = [
      3478 # stun
      3479 # rtp
      3480 # rtp
      5353 # mDNS/multicast
      53317 # LocalSend
      62576 # qBittorrent DHT
    ];

    allowedUDPPortRanges = [
      {
        from = 50000;
        to = 65535;
      }
      {
        from = 1714; # KDE connect
        to = 1764; # KDE connect
      }
    ];
  };
}
