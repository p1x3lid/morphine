{...}: {
  boot.loader = {
    limine = {
      enable = true;
      secureBoot.enable = true;
      enrollConfig = true;
      maxGenerations = 50;
    };
    efi.canTouchEfiVariables = true;
    timeout = 1;
  };
}
