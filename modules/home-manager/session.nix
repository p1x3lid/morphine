{...}: {
  ### Variables
  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/pixel/etc/profile.d/hm-session-vars.sh
  home.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    EDITOR = "hx";
    VISUAL = "hx";
    PAGER = "bat --paging=always";
    XDG_CURRENT_DESKTOP = "kde";
    GDK_BACKEND = "wayland";
    PF_INFO = "ascii title os host kernel uptime pkgs memory";
    SSH_AUTH_SOCK = "$HOME/.bitwarden-ssh-agent.sock";
  };

  gtk = {
    enable = true;
    colorScheme = "dark";
  };

  qt = {
    enable = true;
    platformTheme.name = "kde";
    style.name = "breeze";
  };
}
