{...}: {
  fileSystems = {
    "/" = {
      device = "/dev/mapper/luks-0acafb9c-2ad2-4b0e-92d9-129ec246348c";
      fsType = "btrfs";
      options = ["subvol=@" "compress=zstd:3" "noatime"];
    };
    "/home" = {
      device = "/dev/mapper/luks-0acafb9c-2ad2-4b0e-92d9-129ec246348c";
      fsType = "btrfs";
      options = ["subvol=@home" "compress=zstd:3" "noatime"];
    };
    "/boot" = {
      device = "/dev/disk/by-uuid/43A2-9759";
      fsType = "vfat";
      options = ["fmask=0077" "dmask=0077"];
    };
  };
}
