{pkgs, ...}: {
  services.mako.enable = true;

  services.mako.settings = {
    "background-color" = "#282828ff";
    "text-color" = "#ebdbb2ff";
    "border-color" = "#504945ff";
    "progress-color" = "over #fe8019ff";
    font = "MesloLGM Nerd Font 12";
    markup = true;
    icons = true;
    width = 300;
    height = 100;
    margin = 10;
    padding = 5;
    "border-size" = 2;

    format = ''
      <b><span foreground="#bdae93ff">%s</span></b>\n
      <span foreground="#ebdbb2ff">%b</span>
    '';

    "actionable=true" = {
      "background-color" = "#bdae93ff"; # prompt
      "text-color" = "#282828ff"; # тёмный текст для контраста
      "border-color" = "#504945ff";
    };

    "hidden=true" = {
      format = ''<span foreground="#928374ff">%h hidden</span>'';
      "text-color" = "#928374ff";
      "background-color" = "#2828288a"; # слегка прозрачно для фона
    };

    "urgency=critical" = {
      "border-color" = "#fb4934ff";
      "progress-color" = "source #fb4934ff";
    };

    "counter-color" = "#928374ff";
  };
}
