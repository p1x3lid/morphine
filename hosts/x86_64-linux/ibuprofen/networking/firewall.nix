{
  # for security reasons, only open the following ports to the network by default.
  networking.firewall.allowedTCPPorts = [
    # localsend
    53317

    # tcp ports for testing & sharing
    62576
    63080
    63081
    63082
    63083
    63084
    63085
    63086
    63087
    63088
    63089
  ];

  networking.firewall.allowedTCPPortRanges = [
    {
      # KDE connect
      from = 1714;
      to = 1764;
    }
  ];

  networking.firewall.allowedUDPPorts = [
    # stun
    3478

    # rtp
    3478
    3479

    # mDNS/multicast
    5353
  ];

  networking.firewall.allowedUDPPortRanges = [
    {
      # KDE connect
      from = 1714;
      to = 1764;
    }
    {
      from = 50000;
      to = 65535;
    }
  ];
}
