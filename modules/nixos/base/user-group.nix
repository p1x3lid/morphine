{
  pkgs,
  myvars,
  ...
}: {
  # Don't allow mutation of users outside the config.
  # users.mutableUsers = false;

  users.groups = {
    "${myvars.username}" = {};
    podman = {};
    wireshark = {};
    # for android platform tools's udev rules
    adbusers = {};
    dialout = {};
    # for openocd (embedded system development)
    plugdev = {};
    # misc
    uinput = {};
  };

  users.users."${myvars.username}" = {
    home = "/home/${myvars.username}";
    shell = pkgs.zsh;
    isNormalUser = true;
    extraGroups = [
      myvars.username
      "users"
      "wheel"
      "podman"
      "i2c"
      "libvirtd" # virt-viewer / qemu
    ];
  };
}
