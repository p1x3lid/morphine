{...}: {
  services = {
    xserver = {
      enable = true;
      # Configure keymap in X11
      xkb = {
        layout = "us,ru";
        variant = "";
        options = "grp:caps_toggle,compose:ralt";
      };
    };
  };
}
