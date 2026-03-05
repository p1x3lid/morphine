{pkgs, ...}: {
  programs.dconf.enable = true;

  environment.systemPackages = with pkgs; [
    # CLI tools
    uutils-coreutils-noprefix
    git
    iwd
    ffmpeg-full
    alsa-utils
    ddcutil # tool for change brightness
  ];
}
