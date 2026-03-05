{
  pkgs,
  lib,
  ...
}: {
  security = {
    # Disable sudo
    sudo.enable = false;
    # doas.enable = true;
    run0.enableSudoAlias = true;

    wrappers = {
      su = {
        setuid = lib.mkForce false;
        source = lib.mkForce pkgs.shadow;
      };

      sg = {
        setuid = lib.mkForce false;
        source = lib.mkForce pkgs.shadow;
      };

      # fusermount = {
      #   setuid = lib.mkForce false;
      #   source = pkgs.fuse;
      # };
      # fusermount3 = {
      #   setuid = lib.mkForce false;
      #   source = pkgs.fuse3;
      # };
      # mount = {
      #   setuid = lib.mkForce false;
      #   source = pkgs.util-linux;
      # };
      # pkexec = {
      #   setuid = lib.mkForce false;
      #   source = pkgs.polkit;
      # };
      # newgrp = {
      #   setuid = lib.mkForce false;
      #   source = pkgs.shadow;
      # };
      # newuidmap = {
      #   setuid = lib.mkForce false;
      #   source = pkgs.shadow;
      # };
      # newgidmap = {
      #   setuid = lib.mkForce false;
      #   source = pkgs.shadow;
      # };
    };
  };
}
