{
  pkgs,
  inputs,
  ...
}: {
  home.packages =
    [
      # External flake packages
      inputs.affinity-nix.packages.x86_64-linux.v3 # affinity photo for nix
    ]
    ++ (with pkgs; [
      nautilus # File manager for GNOME
      appflowy # Notion Alternative
      ungoogled-chromium # Open source web browser from Google, with dependencies on Google web services removed
      veracrypt # Free Open-Source filesystem on-the-fly encryption
    ]);
}
