{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    # CLI tools
    uutils-coreutils-noprefix
    helix
    git
    iwd
    ffmpeg-full
    e2fsprogs
    alsa-utils
    ddcutil # tool for change brightness
  ];
}
