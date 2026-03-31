{...}: {
  networking.wireless = {
    enable = false; # Disable wireless support via wpa_supplicant.
    # Enable iwd networking
    iwd = {
      enable = true;
      settings = {
        IPv6.Enabled = true;
        Settings.Autoconnect = true;
      };
    };
  };

  networking.networkmanager.enable = false;
}
