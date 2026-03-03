{
  config,
  username,
  pkgs,
  ...
}: {
  security = {
    polkit.enable = true;
    pam.services.${username}.kwallet = {
      enable = true;
      package = pkgs.kdePackages.kwallet-pam;
    };

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

    rtkit.enable = true;
  };
}
