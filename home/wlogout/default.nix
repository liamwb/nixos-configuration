{config, ... }:
let 
  theme = config.lib.stylix.colors.withHashtag;
  base00 = theme.base00;  # Default Background
  base01 = theme.base01;  # Lighter Background (Used for status bars, line number and folding marks)
  base02 = theme.base02;
  base05 = theme.base05;  # Default Foreground, Caret, Delimiters, Operators
  base06 = theme.base06;
  base08 = theme.base08;  # Variables, XML Tags, Markup Link Text, Markup Lists, Diff Deleted
  base0A = theme.base0A;  # Classes, Markup Bold, Search Text Background
  base0B = theme.base0B;  # Strings, Inherited Class, Markup Code, Diff Inserted
in
{
  programs.wlogout = {
    enable = true;
    layout = [
    {
      label = "lock";
      action = "hyprlock";
      text = "Lock";
      keybind = "l";
    }
    {
      label = "hibernate";
      action = "systemctl hibernate";
      text = "Hibernate";
      keybind = "h";
    }
    {
      label = "logout";
      action = "loginctl terminate-user $USER";
      text = "Logout";
      keybind = "e";
    }
    {
      label = "shutdown";
        action = "systemctl poweroff";
        text = "Shutdown";
        keybind = "s";
    }
    {
      label = "suspend";
        action = "systemctl suspend";
        text = "Suspend";
        keybind = "u";
    }
    {
      label = "reboot";
        action = "systemctl reboot";
        text = "Reboot";
        keybind = "r";
    }

    ];

    style = ''
      * {
              background-image: none;
              box-shadow: none;
      }

      window {
        color: ${base05};
        background-color: ${base00};
      }

      button {
        margin: 8px;
        color: ${base05};
        background-color: ${base01};
        border-style: solid;
        border-width: 2px;
        background-repeat: no-repeat;
        background-position: center;
        background-size: 25%;
            }

        button:active,
        button:focus,
        button:hover {
          background-color: ${base02};
          outline-style: none;
          }

        #lock {
          background-image: image(url("${./icons/lock.svg}"));
        }

        #logout {
          background-image: image(url("${./icons/logout.svg}"));
        }

        #suspend {
          background-image: image(url("${./icons/suspend.svg}"));
        }

        #hibernate {
          background-image: image(url("${./icons/hibernate.svg}"));
        }

        #shutdown {
          background-image: image(url("${./icons/shutdown.svg}"));
        }

        #reboot {
          background-image: image(url("${./icons/reboot.svg}"));
        }
      '';
  };
}

