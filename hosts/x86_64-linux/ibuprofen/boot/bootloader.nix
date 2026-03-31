{...}: {
  boot.loader = {
    limine = {
      enable = true;
      secureBoot.enable = true;
      enrollConfig = true;
      # we use Git for version control, so we don't need to keep too many generations.
      maxGenerations = 10;
    };
    efi.canTouchEfiVariables = true;
    timeout = 1;
  };
}
