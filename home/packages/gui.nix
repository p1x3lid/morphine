{
  pkgs,
  myvars,
  inputs,
  ...
}: {
  home.packages =
    [
      # External flake packages
      inputs.affinity-nix.packages.${myvars.system}.v3 # affinity photo for nix
    ]
    ++ (with pkgs; [
      # desktop apps
      # social
      (discord.override {
        withOpenASAR = true;
        withVencord = true;
      })
      # Entertaiment
      (steam.override {
        extraArgs = "-system-composer";
      })
      vlc # Cross-platform media player and streaming server
      # Tools
      nautilus # File manager for GNOME
      appflowy # Notion Alternative
      waydroid-helper #User-friendly way to configure Waydroid and install extensions, including Magisk and ARM translation
    ]);
}
