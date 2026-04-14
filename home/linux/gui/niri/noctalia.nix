{
  pkgs,
  inputs,
  config,
  ...
}: {
  imports = [
    inputs.noctalia-shell.homeModules.default
  ];

  programs.noctalia-shell = {
    enable = true;

    plugins = {
      sources = [
        {
          enabled = true;
          name = "Official Noctalia Plugins";
          url = "https://github.com/noctalia-dev/noctalia-plugins";
        }
      ];
      states = {
        polkit-agent = {
          enabled = true;
          sourceUrl = "https://github.com/noctalia-dev/noctalia-plugins";
        };
        keybind-cheatsheet = {
          enabled = true;
          sourceUrl = "https://github.com/noctalia-dev/noctalia-plugins";
        };
        privacy-indicator = {
          enabled = true;
          sourceUrl = "https://github.com/noctalia-dev/noctalia-plugins";
        };
        screen-toolkit = {
          enabled = true;
          sourceUrl = "https://github.com/noctalia-dev/noctalia-plugins";
        };
        timer = {
          enabled = true;
          sourceUrl = "https://github.com/noctalia-dev/noctalia-plugins";
        };
      };
      version = 2;
    };

    # pluginSettings = {};

    settings = {
      bar = {
        showCapsule = false;
        hideOnOverview = true;
        widgets = {
          left = [
            {
              id = "Launcher";
              useDistroLogo = true;
              enableColarization = true;
              colorizeSystemIcon = "Primary";
            }
            {
              id = "Workspace";
              characterCount = 2;
              hideUnoccupied = false;
              labelMode = "index";
              fontWeight = "bold";
              pillSize = 0.6;
              iconScale = 0.8;
              showLabelsOnlyWhenOccupied = true;
              enableScrollWheel = true;
            }
            {
              id = "ActiveWindow";
              maxWidth = 145;
              scrollingMode = "hover";
              hideMode = "hidden";
              showIcon = true;
              showText = true;
            }
            {
              id = "MediaMini";
              maxWidth = 145;
              scrollingMode = "hover";
              hideMode = "hidden";
              showAlbumArt = true;
              showArtistFirst = true;
              showProgressRing = true;
            }
          ];
          center = [
            {
              id = "Clock";
              formatHorizontal = "HH:mm ddd, MMM dd";
              formatVertical = "HH mm - dd MM";
              tooltipFormat = "HH:mm ddd";
            }
            {
              id = "plugin:privacy-indicator";
            }
          ];
          right = [
            {id = "Tray";}
            {id = "plugin:screen-toolkit";}
            {
              id = "KeyboardLayout";
              displayMode = "forceOpen";
              showIcon = true;
            }
            {id = "plugin:timer";}
            {
              id = "SystemMonitor";
              compactMode = true;
              showCpuUsage = true;
              showCpuTemp = true;
              showMemoryUsage = true;
              useMonospaceFont = true;
            }
            {
              id = "Battery";
              displayMode = "graphic-clean";
              hideIfNotDetected = true;
            }
            {
              id = "Volume";
              displayMode = "onhover";
              middleClickCommand = "foot wiremix";
            }
            {
              id = "Brightness";
              displayMode = "onhover";
            }
            {
              id = "NotificationHistory";
              showUnreadBadge = true;
            }
            {
              id = "ControlCenter";
              useDistroLogo = false;
              icon = "settings";
            }
          ];
        };
      };

      general = {
        avatarImage = "${config.home.homeDirectory}/Pictures/.face.png";
        dimmerOpacity = 0;
        showScreenCorners = false;
        lockOnSuspend = true;
        lockScreenBlur = 0;
        lockScreenTint = 0;
      };

      ui = {
        fontDefault = "DejaVu Sans";
        fontFixed = "MesloLGM Nerd Font";
        scrollbarAlwaysVisible = true;
        panelsAttachedToBar = true;
      };

      location = {
        name = "Rostov-on-Don, russia";
        autoLocate = false;
        hideWeatherCityName = true;
        firstDayOfWeek = 1;
        useFahrenheit = false;
        use12hourFormat = false;
      };

      wallpaper = {
        directory = "${config.home.homeDirectory}/Pictures/Wallpapers";
        transitionType = ["fade" "disc" "stripes" "wipe" "pixelate" "honeycomb"];
      };

      appLauncher = {
        enableClipboardHistory = true;
        terminalCommand = "foot";
        sortByMostUsed = true;
        viewMode = "list";
        showCategories = true;
      };

      colorSchemes = {
        predefinedScheme = "Gruvbox";
        darkMode = true;
        syncGsettings = true;
      };

      systemMonitor = {
        externalMonitor = "foot btop";
      };

      noctaliaPerformance = {
        disableWallpaper = false;
        disableDesktopWidgets = true;
      };

      dock = {
        enabled = false;
      };

      network = {
        disableDiscoverability = true;
        bluetoothAutoConnect = true;
      };

      audio = {
        spectrumFrameRate = 60;
        visualizerType = "mirrored";
        spectrumMirrored = true;
        volumeFeedback = true;
        volumeStep = 5;
      };

      brightness = {
        enableDdcSupport = true;
        brightnessStep = 5;
        enforceMinimum = true;
      };

      nightLight = {
        enabled = true;
        autoSchedule = true;
        nightTemp = "4000";
        dayTemp = "6500";
      };

      idle = {
        enabled = true;
        screenOffTimeout = 600;
        lockTimeout = 660;
        suspendTimeout = 1800;
        fadeDuration = 5;
      };

      desktopWidgets = {
        enabled = true;
        overviewEnabled = true;
        gridSnap = true;
        monitorWidgets = [
          {
            name = "HDMI-A-1";
            widgets = [
              {
                id = "Weather";
                showBackground = true;
                x = 40;
                y = 80;
              }
              {
                id = "MediaPlayer";
                showBackground = true;
                showAlbumArt = true;
                showButtons = true;
                showVisualizer = true;
                visualizerType = "linear";
                roundedCorners = true;
                hideMode = "visible";
                x = 360;
                y = 80;
              }
            ];
          }
          {
            name = "eDP-1";
            widgets = [
              {
                id = "Weather";
                showBackground = true;
                x = 40;
                y = 80;
              }
              {
                id = "MediaPlayer";
                showBackground = true;
                showAlbumArt = true;
                showButtons = true;
                showVisualizer = true;
                visualizerType = "linear";
                roundedCorners = true;
                hideMode = "visible";
                x = 360;
                y = 80;
              }
            ];
          }
        ];
      };

      templates = {
        activeTemplates = [
          {
            id = "zenBrowser";
            enabled = true;
          }
          {
            id = "niri";
            enabled = true;
          }
          {
            id = "btop";
            enabled = true;
          }
          {
            id = "steam";
            enabled = true;
          }
          {
            id = "telegram";
            enabled = true;
          }
          {
            id = "gtk";
            enabled = true;
          }
          {
            id = "qt";
            enabled = true;
          }
          {
            id = "alacritty";
            enabled = true;
          }
          {
            id = "foot";
            enabled = true;
          }
          {
            id = "kitty";
            enabled = true;
          }
          {
            id = "ghostty";
            enabled = true;
          }
          {
            id = "yazi";
            enabled = true;
          }
          {
            id = "discord";
            enabled = true;
          }
        ];
      };
    };
  };
}
