{pkgs, ...}: {
  imports = [
    ./console-colors.nix
  ];

  environment.variables = {
    "DETSYS_IDS_TELEMETRY" = "disabled";
  };

  services = {
    gvfs.enable = true; # Mount, trash, and other functionalities
    tumbler.enable = true; # Thumbnail support for images
  };

  environment.systemPackages = with pkgs; [
    glib
    gsettings-desktop-schemas
  ];

  programs = {
    # dconf is a low-level configuration system.
    dconf.enable = true;

    # thunar file manager(part of xfce) related options
    thunar = {
      enable = true;
      plugins = with pkgs; [
        thunar-archive-plugin
        thunar-volman
      ];
    };
  };
}
