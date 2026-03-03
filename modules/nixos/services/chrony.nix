{...}: {
  services.chrony = {
    enable = true;
    enableNTS = false; # allow NTS
    serverOption = "iburst";
    servers = [
      # plain NTP
      "ntppool1.time.nl"
      "time.google.com"
      "pool.ntp.org"
    ];

    # Add explicit per-server NTS lines for servers that support it.
    # This produces lines like: server time.cloudflare.com iburst nts
    extraConfig = ''
      # NTS-capable servers — use 'nts' option explicitly
      server time.cloudflare.com iburst nts
      server nts.netnod.se iburst nts

      # other useful NTS/chrony options
      ntsdumpdir /var/lib/chrony
      driftfile /var/lib/chrony/drift
      makestep 0.1 3
    '';
  };
}
