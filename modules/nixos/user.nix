{username, ...}: {
  users.users.${username} = {
    isNormalUser = true;
    extraGroups = [
      "networkmanager"
      "wheel"
      "video"
      "audio"
      "i2c"
      "input"
      "podman"
      "vboxusers"
    ];
  };
}
