{
  config,
  myvars,
  pkgs,
  ...
}: {
  # security with polkit
  security.polkit.enable = true;

  # security with gnome-kering
  services.gnome = {
    gnome-keyring.enable = true;
    # Use gnome keyring's SSH Agent
    # https://wiki.gnome.org/Projects/GnomeKeyring/Ssh
    # gcr-ssh-agent.enable = false;
  };
  # seahorse is a GUI App for GNOME Keyring.
  # programs.seahorse.enable = true;
  # security.pam.services.greetd.enableGnomeKeyring = true;

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
