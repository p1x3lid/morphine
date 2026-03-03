{...}: {
  imports = [
    ./xserver.nix
    ./systemd-dbus.nix
    ./audio.nix
    ./chrony.nix
    ./etc.nix
  ];
}
