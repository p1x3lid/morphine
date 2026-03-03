{...}: {
  nix.settings = {
    substituters = [
      "https://cache.garnix.io"
      "https://install.determinate.systems"
    ];
    trusted-substituters = [
      "https://cache.garnix.io"
      "https://install.determinate.systems"
    ];
    trusted-public-keys = [
      "cache.garnix.io:CTFPyKSLcx5RMJKfLo5EEPUObbA78b0YQ2DTCJXqr9g="
      "cache.flakehub.com-3:hJuILl5sVK4iKm86JzgdXW12Y2Hwd5G07qKtHTOcDCM="
    ];
  };
}
