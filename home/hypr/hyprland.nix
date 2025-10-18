{pkgs, lib, ...}:
let 
mainMod = "SUPER";
terminal = "foot";
browser = "firefox";
in
{

  wayland.windowManager.hyprland = {

    enable = true;

    settings = {
################
### MONITORS ###
###############

# REMEMBER TO SET MONITOR PER-HOST
# See https://wiki.hyprland.org/Configuring/Keywords/

      xwayland = {
        force_zero_scaling = true;
      };

      env = [
        "XCURSOR_SIZE,24"
        "HYPRCURSOR_SIZE,24"
        "QT_QPA_PLATFORMTHEME,qt5ct"  # enable qt5ct theming, kvantum
        "QT_QPA_PLATFORM=wayland;xcb"  # tell QT apps to use wayland first
      ];

      exec-once = [
        "lxqt-policykit-agent"
        "mako"
        "nm-applet"
        "blueman-applet"
        "hyprpaper" # set wallpaper (stylix does this now)
        "waybar"
        "hypridle"
# make sure that xdg-desktop-portal-hyprland can get the required variables on startup.
        "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP "
        "onedrive --sync"
      ];

      general = { 
        gaps_in = 5;
        gaps_out = 5;  # 20

        border_size = 2;

# COLOURS MANAGED BY STYLIX
# https://wiki.hyprland.org/Configuring/Variables/#variable-types for info about colors
        # "col.active_border" = "rgba(660000aa)";  # "rgba(33ccffee)" "rgba(00ff99ee)"
        # "col.inactive_border" = "rgba(595959aa)";

# Set to true enable resizing windows by clicking and dragging on borders and gaps
        resize_on_border = true;

# Please see https://wiki.hyprland.org/Configuring/Tearing/ before you turn this on
        allow_tearing = false;

        layout = "dwindle";
      };

# https://wiki.hyprland.org/Configuring/Variables/#decoration
      decoration = {
        rounding = 10;

# Change transparency of focused and unfocused windows
        active_opacity = 1.0;
        inactive_opacity = 1.0;  # 1.0

        shadow = {
          enabled = true;
        };

# https://wiki.hyprland.org/Configuring/Variables/#blur
        blur = {
          enabled = true;
          size = 3;
          passes = 1;
          vibrancy = 0.1696;
        };
      };

# https://wiki.hyprland.org/Configuring/Variables/#animations
      animations = {
        enabled = true;

# Default animations, see https://wiki.hyprland.org/Configuring/Animations/ for more;

        bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";

        animation = [
          "windows, 1, 7, myBezier"
          "windowsOut, 1, 7, default, popin 80%"
          "border, 1, 10, default"
          "borderangle, 1, 8, default"
          "fade, 1, 7, default"
          "workspaces, 1, 6, default"
          "specialWorkspace, 1, 4, default, slidefadevert -20%"
        ];
      };

# See https://wiki.hyprland.org/Configuring/Dwindle-Layout/ for more
      dwindle = {
        pseudotile = true; # Master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below;
        preserve_split = true; # You probably want this
        special_scale_factor = 0.8;
      };

# See https://wiki.hyprland.org/Configuring/Master-Layout/ for configuring master layout

# https://wiki.hyprland.org/Configuring/Variables/#misc
      misc = { 
        force_default_wallpaper = 1; # Set to 0 or 1 to disable the anime mascot wallpapers
        disable_hyprland_logo = true; # If true disables the random hyprland logo / anime girl background. :(
      };

#############
### INPUT ###
#############

# https://wiki.hyprland.org/Configuring/Variables/#input
      input = {
      kb_layout = "us";
# kb_variant =
# kb_model =
# kb_options =
# kb_rules =

      follow_mouse = 1;

      # sensitivity = 0; # -1.0 - 1.0, 0 means no modification.

      touchpad = {
      natural_scroll = true;
      tap-to-click = false;
      };
      };

# https://wiki.hyprland.org/Configuring/Variables/#gestures
      gestures = {
        workspace_swipe = true;
      };

# See https://wiki.hyprland.org/Configuring/Keywords/#per-device-input-configs for more


####################
### WINDOW RULES ###
####################

      # windowrule = [ 
      #   "size 400,Lxpolkit"
      #   "stayfocused,Lxpolkit"
      # ];

########################
### END WINDOW RULES ###
########################


####################
### KEYBINDINGSS ###
####################

# See https://wiki.hyprland.org/Configuring/Keywords/

      bind = [
        "${mainMod}, Q, exec, ${terminal}"
        "${mainMod}, B, exec, ${browser}"
        "ALT, F4, killactive,"
        "${mainMod}, M, exit,"
# "${mainMod}, E, exec, $fileManager"
        "${mainMod}, F, togglefloating,"
# "${mainMod}, R, exec, $menu"
        "${mainMod}, P, pseudo, "# dwindle
        "${mainMod}, J, togglesplit, "# dwindle

# Move focus with mainMod + arrow keys
        "${mainMod}, left, movefocus, l"
        "${mainMod}, right, movefocus, r"
        "${mainMod}, up, movefocus, u"
        "${mainMod}, down, movefocus, d"

# Switch workspaces with mainMod + [0-9]
        "${mainMod}, 1, workspace, 1"
        "${mainMod}, 2, workspace, 2"
        "${mainMod}, 3, workspace, 3"
        "${mainMod}, 4, workspace, 4"
        "${mainMod}, 5, workspace, 5"
        "${mainMod}, 6, workspace, 6"
        "${mainMod}, 7, workspace, 7"
        "${mainMod}, 8, workspace, 8"
        "${mainMod}, 9, workspace, 9"
        "${mainMod}, 0, workspace, 10"

# Move active window to a workspace with mainMod + SHIFT + [0-9]
        "${mainMod} SHIFT, 1, movetoworkspace, 1"
        "${mainMod} SHIFT, 2, movetoworkspace, 2"
        "${mainMod} SHIFT, 3, movetoworkspace, 3"
        "${mainMod} SHIFT, 4, movetoworkspace, 4"
        "${mainMod} SHIFT, 5, movetoworkspace, 5"
        "${mainMod} SHIFT, 6, movetoworkspace, 6"
        "${mainMod} SHIFT, 7, movetoworkspace, 7"
        "${mainMod} SHIFT, 8, movetoworkspace, 8"
        "${mainMod} SHIFT, 9, movetoworkspace, 9"
        "${mainMod} SHIFT, 0, movetoworkspace, 10"

# Example special workspace (scratchpad)
        "${mainMod}, S, togglespecialworkspace, magic"
        "${mainMod} SHIFT, S, movetoworkspace, special:magic"

# Scroll through existing workspaces with mainMod + control + arrows
        "${mainMod}&Control_L, right, workspace, r+1"
        "${mainMod}&Control_L, left, workspace, r-1"

# Move active window to a workspace with mainMod + control + SHIFT + arrows
        "${mainMod} Control_L SHIFT, right, movetoworkspace, r+1"
        "${mainMod} Control_L SHIFT, left, movetoworkspace, r-1"

# launcher
        "${mainMod}, space, exec, fuzzel"
# bar
        "${mainMod}, K, exec, pkill waybar || waybar"

# SCREENSHOTS #
# screenshot area
        "${mainMod}, A, exec, grimblast --notify copy area"
# screenshot whole screen
        "${mainMod} SHIFT, A, exec, grimblast --notify copy output"
        ];

      binde = [
# volume control with media keys (taken from hyprland wiki)
# allow press and hold, volume limited to 100%
         ", XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
         ", XF86AudioRaiseVolume, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ 0"
# Example volume button that will activate even while an input inhibitor is active
          ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
          ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"

# brightness control
          ", XF86MonBrightnessUp, exec, brightnessctl set 5%+"
          ", XF86MonBrightnessDown, exec, brightnessctl set 5%-"
      ];

      bindm = [
# Move/resize windows with mainMod + LMB/RMB and dragging
        "${mainMod}, mouse:272, movewindow"
        "${mainMod}, mouse:273, resizewindow"
      ];


##############################
### WINDOWS AND WORKSPACES ###
##############################

# See https://wiki.hyprland.org/Configuring/Window-Rules/ for more
# See https://wiki.hyprland.org/Configuring/Workspace-Rules/ for workspace rules

# Example windowrule v1
# windowrule = float, ^(kitty)$

# Example windowrule v2
# "float,class:^(kitty)$,title:^(kitty)$"
      windowrulev2 = [
        "suppressevent maximize, class:.*" # You'll probably like this.

# make waybar applets open as windows 
          "float,class:(blueman-manager-wrapped|nm-connection-editor|pavucontrol)"

# Thunderbird pop-up windows
          "float,class:^(thunderbird)$,title:^(New Event:|Edit Item)$"

# wifi menu with rofi (or anything rofi for that matter) should not tile
          "float,class:Rofi"
# openssh authentication should float
        "float,class:OpenSSH Authentication Passphrase request"
        "float,class:org.kde.kwalletmanager5"

# matplotlib should float
        "float,class:Matplotlib"

# fix to allow XWayland to share windows with Wayland
          "opacity 0.0 override,class:^(xwaylandvideobridge)$"
          "noanim,class:^(xwaylandvideobridge)$"
          "noinitialfocus,class:^(xwaylandvideobridge)$"
          "maxsize 1 1,class:^(xwaylandvideobridge)$"
          "noblur,class:^(xwaylandvideobridge)$"
      ];
    };
  };
}
