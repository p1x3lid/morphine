{pkgs, ...}: {
  home.packages = with pkgs; [
    nautilus # File manager for GNOME
    appflowy # Notion Alternative
    ungoogled-chromium # Open source web browser from Google, with dependencies on Google web services removed
    veracrypt # Free Open-Source filesystem on-the-fly encryption
  ];
}
