{config, lib, pkgs, ...}:
let 
  theme = config.lib.stylix.colors.withHashtag;
  base00 = theme.base00;  # Default Background
  base01 = theme.base01;  # Lighter Background (Used for status bars, line number and folding marks)
  base02 = theme.base02;  # Selection Background
  base03 = theme.base03;  # Comments, Invisibles, Line Highlighting
  base04 = theme.base04;  # Dark Foreground (Used for status bars)
  base05 = theme.base05;  # Default Foreground, Caret, Delimiters, Operators
  base06 = theme.base06;  # Light Foreground (Not often used)
  base07 = theme.base07;  # Light Background (Not often used)
  base08 = theme.base08;  # Variables, XML Tags, Markup Link Text, Markup Lists, Diff Deleted
  base09 = theme.base09;  # Integers, Boolean, Constants, XML Attributes, Markup Link Url
  base0A = theme.base0A;  # Classes, Markup Bold, Search Text Background
  base0B = theme.base0B;  # Strings, Inherited Class, Markup Code, Diff Inserted
  base0C = theme.base0C;  # Support, Regular Expressions, Escape Characters, Markup Quotes
  base0D = theme.base0D;  # Functions, Methods, Attribute IDs, Headings
  base0E = theme.base0E;  # Keywords, Storage, Selector, Markup Italic, Diff Changed
  base0F = theme.base0F;  # Deprecated, Opening/Closing Embedded Language Tags, e.g. <?php ?>
in
{
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
    theme = builtins.toString (pkgs.writeText "rofi-theme" ''
// define colors etc.
* {
    bg: ${base00};
    hv: ${base02}; 
    primary: ${base05}; 
    font: "Monospace 11";
    background-color: @bg;
    //dark: @bg;
    border: 0px;
    kl: ${base0D};
    black: ${base03};

    transparent: rgba(46,52,64,0);
}

configuration{
    modi: ["drun", "window", "run"];
    icon-theme: "Papirus-Dark";
    show-icons: true;
    terminal: "foot";
    drun-display-format: "{icon} {name}";
    location: 0;
    disable-history: false;
    sidebar-mode: false;
    display-drun: " ";
    display-run: " ";
    display-window: " ";
    
    //adding vim keybindings
    kb-row-up: "Up,Control+k";
    kb-row-left: "Left,Control+h";
    kb-row-right: "Right,Control+l";
    kb-row-down: "Down,Control+j";

    kb-accept-entry: "Control+z,Control+y,Return,KP_Enter";

    //fixing up
    kb-remove-to-eol: "";
    kb-move-char-back: "Control+b";
    kb-remove-char-back: "BackSpace";
    kb-move-char-forward: "Control+f";
    kb-mode-complete: "Control+o";
}

// defines different aspects of the window
window {
    width: 700;
    orientation: horizontal;
    location: center;
    anchor: center;
    transparency: "screenshot";
    border-color: @primary;   
    border: 1px;
    border-radius: 3px;
    spacing: 0;
    children: [ mainbox ];
}

mainbox {
    spacing: 0;
    children: [ inputbar, message, listview ];
}

inputbar {
    color: @kl;
    padding: 11px;
    border: 1px 1px 2px 1px;
    border-color: @primary;
    border-radius: 3px 3px 0px 0px;
}

message {
    padding: 0;
    border-color: @primary;
    border: 0px 1px 1px 1px;
}

entry, prompt, case-indicator {
    text-font: inherit;
    text-color: inherit;
}

entry {
    cursor: pointer;
}

prompt {
    margin: 0px 5px 0px 0px;
}

listview {
    layout: vertical;
    //spacing: 5px;
    padding: 8px;
    lines: 12;
    columns: 1;
    border: 1px 1px 1px 1px; 
    border-radius: 0px 0px 3px 3px;
    border-color: @primary;
    dynamic: false;
}

element {
    padding: 2px;
    vertical-align: 1;
    color: @kl;
    font: inherit;
}

element-text {
    background-color: inherit;
    text-color: inherit;
}

element selected.normal {
    color: @black;
    background-color: @hv;
}

element normal active {
    background-color: @hv;
    color: @black;
}

element-text, element-icon {
    background-color: inherit;
    text-color: inherit;
}

element normal urgent {
    background-color: @primary;
}

element selected active {
    background: @hv;
    foreground: @bg;
}

button {
    padding: 6px;
    color: @primary;
    horizonatal-align: 0.5;

    border: 1px 0px 1px 1px;
    border-radius: 4px 0px 0px 4px;
    border-color: @primary;
}

button selected normal {
    border: 1px 0px 1px 1px;
    border-color: @primary;
}

scrollbar {
    enabled: true;
} 
    '');
  };
}
