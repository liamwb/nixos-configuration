{config, lib, ...}:
let 
  theme = config.lib.stylix.colors.withHashtag;
  base00 = theme.base00;  # Default Background
  base01 = theme.base01;  # Lighter Background (Used for status bars, line number and folding marks)
  base05 = theme.base05;  # Default Foreground, Caret, Delimiters, Operators
  base08 = theme.base08;  # Variables, XML Tags, Markup Link Text, Markup Lists, Diff Deleted
  base0A = theme.base0A;  # Classes, Markup Bold, Search Text Background
  base0B = theme.base0B;  # Strings, Inherited Class, Markup Code, Diff Inserted
in
{
  options.programs.hyprlock.backgroundImage = lib.mkOption {
      type = lib.types.path;
      default = "";
      description = "Path to the background image for Hyprlock";
  };
  # avoid error "caused by introducing a top-level config' or options' attribute. Add configuration attributes immediately on the top level instead, or move all of them (namely: programs) into the explicit config' attribute."
  config.programs.hyprlock = {
      enable = true;

      extraConfig = ''
          background {
              monitor =
                  path = ${config.programs.hyprlock.backgroundImage}

# all these options are taken from hyprland, see https://wiki.hyprland.org/Configuring/Variables/#blur for explanations
              blur_passes = 1 # 0 disables blurring
                  blur_size = 1
          }

      input-field {
          monitor =
              size = 200, 30
              outline_thickness = 1
              dots_size = 0.33 # Scale of input-field height, 0.2 - 0.8
              dots_spacing = 0.15 # Scale of dots' absolute size, 0.0 - 1.0
              dots_center = false
              dots_rounding = -1 # -1 default circle, -2 follow input-field rounding
              outer_color = rgb(${base01})
              inner_color = rgb(${base00})
              font_color = rgb(${base05})
              fade_on_empty = false
              fade_timeout = 1000 # Milliseconds before fade_on_empty is triggered.
              placeholder_text = <b>Password...</b> # Text rendered in the input box when it's empty.
              hide_input = false
              rounding = 5 # -1 means complete rounding (circle/oval)
              check_color = rgb(${base0A})
              fail_color = rgb(${base08}) # if authentication failed, changes outer_color and fail message color
              fail_text = <i>$FAIL <b>($ATTEMPTS)</b></i> # can be set to empty
              fail_transition = 300 # transition time in ms between normal outer_color and fail_color
              capslock_color = rgb(${base0B})
              numlock_color = -1
              bothlock_color = -1 # when both locks are active. -1 means don't change outer color (same for above)
              invert_numlock = false # change color if numlock is off
              swap_font_color = false # see below
              position = 0, -40
              halign = center
              valign = center
      }

      label {
          monitor =
              text = cmd[update:1000] echo "$TIME"
              color = rgb(${base05})
              font_size = 55
              font_family = sans-serif
              position = -100, -40
              halign = right
              valign = bottom
              shadow_passes = 5
              shadow_size = 10
      }

      label {
          monitor =
              text = $USER
              color = rgb(${base05})
              font_size = 20
              font_family = sans-serif
              position = -100, 160
              halign = right
              valign = bottom
              shadow_passes = 5
              shadow_size = 10
      }
      general {
          hide_cursor = false
      }
      '';
  };
}
