{...}: {
  fileSystems = {
    "/" = {
      device = "/dev/mapper/luks-0cb4bc78-13ff-4891-ac25-50dd710308c6";
      fsType = "btrfs";
      options = ["subvol=@" "compress=zstd:3" "noatime"];
    };
    "/home" = {
      device = "/dev/mapper/luks-0cb4bc78-13ff-4891-ac25-50dd710308c6";
      fsType = "btrfs";
      options = ["subvol=@home" "compress=zstd:3" "noatime"];
    };
    "/boot" = {
      device = "/dev/disk/by-uuid/73C9-6B83";
      fsType = "vfat";
      options = ["fmask=0077" "dmask=0077"];
    };
  };
}
