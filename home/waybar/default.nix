{config, ...}:
let 
  theme = config.lib.stylix.colors.withHashtag;
  base00 = theme.base00;
  base02 = theme.base02;
  base04 = theme.base04;
  red = theme.red;
  bright-magenta = theme.bright-magenta;
  yellow = theme.yellow;
  blue = theme.blue;
  bright-cyan = theme.bright-cyan;
  bright-blue = theme.bright-blue;
  green = theme.green;
  brown = theme.brown;
  base05 = theme.base05;
  base06 = theme.base06;
  base07 = theme.base07;
in
{
  home.file.".config/waybar/config".source = ./config;
  programs.waybar = {
    enable = true;

    style = ''
* {
    font-family: "JetBrainsMono Nerd Font", Roboto, Helvetica, Arial, sans-serif;
    font-size: 16px;
}

window#waybar {
    background-color: rgba(0,0,0,0);
    border-radius: 5px;
    transition-property: background-color;
    transition-duration: .5s;
}

button {
    /* Use box-shadow instead of border so the text isn't offset */
    box-shadow: inset 0 -3px transparent;
    /* Avoid rounded borders under each button name */
    border: none;
    border-radius: 0;
}
waybar
/* https://github.com/Alexays/Waybar/wiki/FAQ#the-workspace-buttons-have-a-strange-hover-effect */
button:hover {
    background: inherit;
    box-shadow: inset 0 -3px #ffffff;
}


/* you can set a style on hover for any module like this */
#pulseaudio:hover {
    background-color: ${base02};
}
#backlight:hover {
    background-color: ${base02};
}
#network:hover {
    background-color: ${base02};
}
#bluetooth:hover {
    background-color: ${base02};
}
#battery:hover {
    background-color: ${base02};
}
#temperature:hover {
    background-color: ${base02};
}
#clock:hover {
    background-color: ${base02};
}

#workspaces button {
    color: ${base05};
    padding: 0 5px;
    background-color: transparent;
}


#workspaces button:hover {
    background: rgba(0, 0, 0, 0.2);
}

#workspaces button.focused {
    background-color: ${base07};
    box-shadow: inset 0 -3px #ffffff;
}

#workspaces button.urgent {
    background-color: #eb4d4b;
}

#mode {
    background-color: #64727D;
    box-shadow: inset 0 -3px #ffffff;
}

#clock,
#battery,
#cpu,
#memory,
#temperature,
#network,
#bluetooth,
#pulseaudio
{
    padding: 0 10px;
}

#pulseaudio {
    color: ${red};
}

#backlight {
    color: ${bright-magenta}
}

#network {
    color: ${yellow};
}

#bluetooth{
    color: ${blue};
}

#temperature {
    color: ${bright-blue};
}

#battery {
    color: ${green};
}

#clock {
    color: ${brown};
}

.modules-right,.modules-center {
    background-color: ${base00}; 
    border-radius: 5px;
    border-color: #f53c3c;
}

#custom-power-button {
    background-color: ${base00};
    color: ${base05};
    border-radius: 5px;
    border-color: #f53c3c;
    padding-left: 10px;
    padding-right: 13px;
    margin-right: 10px;
    margin-left: -10px;
}

.modules-right {
    padding: 0 10px;
}

.modules-left {
    padding: 0 10px;
}

.modules-center {
    padding: 0 10px;
}
#battery.charging, #battery.plugged {
    color: ${bright-cyan};
}

@keyframes blink {
    to {
        color: #000000;
    }
}

/* Using steps() instead of linear as a timing function to limit cpu usage */
#battery.critical:not(.charging) {
    background-color: #f53c3c;
    color: #ffffff;
    animation-name: blink;
    animation-duration: 0.5s;
    animation-timing-function: steps(12);
    animation-iteration-count: infinite;
    animation-direction: alternate;
}

label:focus {
    background-color: #000000;
}

#pulseaudio.muted {
    color: ${base05};
}

    '';
  };
}
