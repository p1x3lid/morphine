{
  config,
  myvars,
  pkgs,
  ...
}: {
  # security with polkit
  security.polkit.enable = true;

  # enable PAM for hyprlock
  security.pam.services.hyprlock = {};

  security.pam.services.${myvars.username}.kwallet = {
    enable = true;
    package = pkgs.kdePackages.kwallet-pam;
  };

  environment.systemPackages = [
    # Tool to manage the passwords on your system
    pkgs.kdePackages.kwalletmanager
  ];

  security.pam.services.greetd.enableKwallet = true;

  security = {
    # Kernel Security Settings
    protectKernelImage = true;
    lockKernelModules = false; # this breaks iptables, wireguard, and virtd

    # force-enable the Page Table Isolation (PTI) Linux kernel feature
    forcePageTableIsolation = true;

    # User namespaces are required for sandboxing.
    # this means you cannot set `"user.max_user_namespaces" = 0;` in sysctl
    allowUserNamespaces = true;

    # Disable unprivileged user namespaces, unless containers are enabled
    unprivilegedUsernsClone = config.virtualisation.containers.enable;
    allowSimultaneousMultithreading = true;
  };
}
