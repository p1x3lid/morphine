{pkgs, ...}: {
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --remember";
        user = "pixel";
      };
    };
  };
  # services.displayManager.ly = {
  # enable = true;
  # settings = {
  # The active animation
  # none     -> Nothing
  # doom     -> PSX DOOM fire
  # matrix   -> CMatrix
  # colormix -> Color mixing shader
  # gameoflife -> John Conway's Game of Life
  # dur_file -> .dur file format (https://github.com/cmang/durdraw/tree/master)
  # config example at https://codeberg.org/fairyglade/ly/src/branch/master/res/config.ini#L21
  # animation = "colormix";
  # clock = "%H:%M";
  # bigclock = "en";
  # hide_borders = true;
  # blank_box = true;
  # center = true;
  # bg = 0;
  # fg = 2;
  # input_fg = 4;
  # battery_id = "BAT1";
  # };
  # };
}
