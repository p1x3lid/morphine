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

      luks.devices."luks-0acafb9c-2ad2-4b0e-92d9-129ec246348c" = {
        device = "/dev/nvme0n1p5";
        allowDiscards = true;
      };
    };
  };
}
