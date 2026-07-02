{ pkgs, inputs, ... }:
{
  home-manager.users.drfoobar = {
    # import the home manager module
    imports = [
      inputs.noctalia.homeModules.default
    ];

    # configure options
    programs.noctalia-shell = {
      enable = true;
      settings = {
        # configure noctalia here
        bar = {
          density = "compact";
          position = "right";
          showCapsule = false;
          widgets = {
            left = [
              {
                id = "ControlCenter";
                useDistroLogo = true;
              }
              {
                id = "Network";
              }
              {
                id = "Bluetooth";
              }
            ];
            center = [
              {
                hideUnoccupied = false;
                id = "Workspace";
                labelMode = "none";
              }
            ];
            right = [
              {
                alwaysShowPercentage = false;
                id = "Battery";
                warningThreshold = 30;
              }
              {
                formatHorizontal = "HH:mm";
                formatVertical = "HH mm";
                id = "Clock";
                useMonospacedFont = true;
                usePrimaryColor = true;
              }
            ];
          };
        };
        colorSchemes.predefinedScheme = "Monochrome";
        general = {
          avatarImage = "/home/drfoobar/.face";
          radiusRatio = 0.2;
        };
        location = {
          monthBeforeDay = true;
          name = "Marseille, France";
        };
      };
      # this may also be a string or a path to a JSON file.
    };



imports = [
      inputs.noctalia.homeModules.default
    ];

    # configure options
    programs.noctalia-shell = {
      enable = true;
      colors = {
        # you must set ALL of these
        mError = "#dddddd";
        mOnError = "#111111";
        mOnPrimary = "#111111";
        mOnSecondary = "#111111";
        mOnSurface = "#828282";
        mOnSurfaceVariant = "#5d5d5d";
        mOnTertiary = "#111111";
        mOnHover = "#ffffff";
        mOutline = "#3c3c3c";
        mPrimary = "#aaaaaa";
        mSecondary = "#a7a7a7";
        mShadow = "#000000";
        mSurface = "#111111";
        mHover = "#1f1f1f";
        mSurfaceVariant = "#191919";
        mTertiary = "#cccccc";
      };
      # this may also be a string or a path to a JSON file.
    };




    programs.noctalia-shell = {
      enable = true;
      settings = {
        templates = {
          enableUserTemplates = true;
        };
      };
      user-templates = ''
        [config]
        # General template settings
        [templates.myapp]
        input_path = "~/.config/noctalia/templates/myapp.css"
        output_path = "~/.config/myapp/theme.css"
        post_hook = "myapp --reload-theme"
      '';
    };

        programs.noctalia-shell = {
      enable = true;
      settings = {
        templates = {
          enableUserTemplates = true;
        };
      };
      user-templates = ./path/to/user-templates.toml;
    };


        imports = [
      inputs.noctalia.homeModules.default
    ];

    # configure options
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
          catwalk = {
            enabled = true;
            sourceUrl = "https://github.com/noctalia-dev/noctalia-plugins";
          };
        };
        version = 2;
      };
      # this may also be a string or a path to a JSON file.

      pluginSettings = {
        catwalk = {
          minimumThreshold = 25;
          hideBackground = true;
        };
        # this may also be a string or a path to a JSON file.
      };
    };



  };
}
