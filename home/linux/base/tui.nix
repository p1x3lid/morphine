{pkgs, ...}: {
  home.packages = with pkgs; [
    impala # TUI for managing wifi
    bluetui # TUI for managing bluetooth on Linux
    wiremix # TUI mixer for PipeWire
  ];
}
