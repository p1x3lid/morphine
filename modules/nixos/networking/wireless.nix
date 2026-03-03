{...}: {
  networking = {
    # Enable iwd networking
    wireless = {
      enable = false; # Disable wireless support via wpa_supplicant.
      iwd = {
        enable = true;
        settings = {
          IPv6.Enabled = true;
          Settings = {
            Autoconnect = true;
          };
        };
      };
    };

    networkmanager.enable = false;
  };
}
