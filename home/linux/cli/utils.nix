{pkgs, ...}: {
  home.packages = with pkgs; [
    curl
    wget
    ripgrep
    fd
    fzf
    jq
    unzip
    bat
    chezmoi
    trashy
  ];
}
