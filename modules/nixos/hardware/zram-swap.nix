{...}: {
  # Enable Zram and Swap
  zramSwap = {
    enable = true;
    priority = 100;
    memoryPercent = 80;
    algorithm = "zstd";
  };
}
