{...}: {
  programs.git = {
    enable = true;
    signing = {
      key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKgFCAPwVhm/Xly252wSaFaqyR2Ci9qPnhL1/CjfZzX/";
      signByDefault = true;
    };

    settings = {
      user = {
        name = "pixel";
        email = "pixelcmnd@icloud.com";
      };

      gpg.format = "ssh";

      push = {autoSetupRemote = true;};
    };
  };
}
