{pkgs, ...}: {
  home.packages = with pkgs; [
    (steam.override {
      extraArgs = "-system-composer";
    })

    (discord.override {
      withOpenASAR = true;
      withVencord = true;
    })

    vlc # Cross-platform media player and streaming server
  ];
}
