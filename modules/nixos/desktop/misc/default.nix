{...}: {
  imports = [
    ./console-colors.nix
  ];

  environment.variables = {
    "DETSYS_IDS_TELEMETRY" = "disabled";
  };
}
