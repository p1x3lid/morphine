{...}: {
  home.shell.enableNushellIntegration = true;
  home.shell.enableFishIntegration = true;

  programs = {
    lazygit.enableNushellIntegration = true;

    atuin = {
      enable = true;
      enableNushellIntegration = true;
      enableFishIntegration = true;
    };

    carapace = {
      enable = true;
      enableNushellIntegration = true;
      enableFishIntegration = true;
    };

    zoxide = {
      enable = true;
      enableNushellIntegration = true;
      enableFishIntegration = true;
    };
  };
}
