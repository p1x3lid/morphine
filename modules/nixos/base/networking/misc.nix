{
  # Use an NTP server located in the mainland of China to synchronize the system time
  networking.timeServers = [
    "ntppool1.time.nl"
    "time.google.com"
    "pool.ntp.org"
    "time.cloudflare.com"
  ];

  # dynamically update /etc/hosts for testing
  # Note that changes made in this way will be discarded when switching configurations.
  environment.etc.hosts.mode = "0644";
}
