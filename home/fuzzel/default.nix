{config, lib, pkgs, ...}:
let 
  theme = config.lib.stylix.colors.withHashtag;
  background = theme.base00;  # Default Background
  light_background = theme.base01;  # Lighter Background (Used for status bars, line number and folding marks)
  selection_background = theme.base02;  # Selection Background
  foreground = theme.base05;  # Default Foreground, Caret, Delimiters, Operators
in
{
    programs.fuzzel = {
        enable = true;
        settings = {
            main = {
            font = lib.mkForce "Monospace:size=14";
        };
        };
    };
}
