{pkgs, ...}: {
  imports = [
    ./hypridle.nix
  ];

  home.packages = with pkgs; [
    hypridle
  ];
}
