{pkgs, ...}: {
  fonts.packages = with pkgs; [
    adwaita-fonts
    noto-fonts
    noto-fonts-color-emoji
    nerd-fonts.caskaydia-mono
    nerd-fonts.meslo-lg
  ];
}
