{pkgs, ...}: {
  programs.fuzzel.enable = true;

  programs.fuzzel.settings = {
    main = {
      font = "MesloLGM Nerd Font:size=13";
      dpi-aware = true;
      prompt = "\"~> \"";

      terminal = "${pkgs.alacritty}/bin/alacritty";
      layer = "overlay";
      exit-on-keyboard-focus-loss = true;
    };

    colors = {
      background = "282828ff";
      text = "ebdbb2ff";
      message = "ebdbb2ff";
      prompt = "bdae93ff";
      placeholder = "928374ff";
      input = "ebdbb2ff";
      match = "fb4934ff";
      selection = "3c3836ff";
      selection-text = "ebdbb2ff";
      selection-match = "fe8019ff";
      counter = "928374ff";
      border = "504945ff";
    };

    border = {
      width = 1;
      radius = 10;
    };
  };
}
