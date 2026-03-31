{...}: {
  boot = {
    initrd = {
      systemd.enable = true;

      kernelModules = [
        "i915"
        "drm"
        "drm_kms_helper"
        "xhci_pci"
        "ahci"
        "nvme"
        "usb_storage"
        "usbhid"
        "vfat"
      ];

      availableKernelModules = [
        "xhci_pci"
        "ahci"
        "nvme"
        "usb_storage"
        "usbhid"
        "sd_mod"
        "vfat"
        "i915"
        "drm"
        "drm_kms_helper"
      ];

      luks.devices."luks-0cb4bc78-13ff-4891-ac25-50dd710308c6" = {
        device = "/dev/nvme0n1p2";
        allowDiscards = true;
      };
    };
  };
}
