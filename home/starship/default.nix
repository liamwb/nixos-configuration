{lib, config, ...}:
let
  # Take colours from stylix theme
  theme = config.lib.stylix.colors.withHashtag;
  surface1 = theme.base03;
  orange = theme.orange;
  red = theme.red;
  magenta = theme.magenta;
  bright-cyan = theme.bright-cyan;
  blue = theme.blue;
in {
  programs.starship = {
    enable = true;
    enableFishIntegration = true;
    # settings = lib.importTOML ./starship.toml;

    settings = {
      format = lib.concatStrings [
        "[](${red})"
        "$os"
        "$username"
        "[](bg:${orange} fg:${red})"
        "$directory"
        "[](fg:${orange} bg:${magenta})"
        "$git_branch"
        "$git_status"
        "[](fg:${magenta} bg:${bright-cyan})"
        "$c"
        "$elixir"
        "$elm"
        "$golang"
        "$gradle"
        "$haskell"
        "$java"
        "$julia"
        "$nodejs"
        "$nim"
        "$rust"
        "$scala"
        "$python"
        "$custom"
        "[](fg:${bright-cyan} bg:${blue})"
        "$time"
        "[ ](fg:${blue})"
      ];
      # Disable the blank line at the start of the prompt
      add_newline = true;

      # You can also replace your username with a neat symbol like   or disable this
      # and use the os module below
      username = {
        show_always = true;
        style_user = "bg:${red} fg:${surface1}";
        style_root = "bg:${red} fg:${surface1}";
        format = "[$user ]($style)";
        disabled = false;
      };

      # An alternative to the username module which displays a symbol that
      # represents the current operating system
      os = {
        style = "bg:${red} fg:${surface1}";
        disabled = true;  # Disabled by default
      };

      directory = {
        style = "bg:${orange} fg:${surface1}";
        format = "[ $path ]($style)";
        truncation_length = 3;
        truncation_symbol = "…/";
      };

# Here is how you can shorten some long paths by text replacement
# similar to mapped_locations in Oh My Posh:

      directory.substitutions = {
        "Documents" = "󰈙 ";
        "Downloads" = " ";
        "Music" = " ";
        "Pictures" = " ";
# Keep in mind that the order matters. For example:
# "Important Documents" = " 󰈙 "
# will not be replaced, because "Documents" was already substituted before.
# So either put "Important Documents" before "Documents" or use the substituted version:
# "Important 󰈙 " = " 󰈙 "
      };

      elixir = {
        symbol = " ";
        style = "bg:${bright-cyan} fg:${surface1}";
        format = "[ $symbol ($version) ]($style)";
      };

      elm = {
        symbol = " ";
        style = "bg:${bright-cyan} fg:${surface1}";
        format = "[ $symbol ($version) ]($style)";
      };

      git_branch = {
        symbol = "";
        style = "bg:${magenta} fg:${surface1}";
        format = "[ $symbol $branch ]($style)";
      };

      git_status = {
        style = "bg:${magenta} fg:${surface1}";
        format = "[$all_status$ahead_behind ]($style)";
      };

      golang = {
        symbol = " ";
        style = "bg:${bright-cyan} fg:${surface1}";
        format = "[ $symbol ($version) ]($style)";
      };

      gradle = {
        style = "bg:${bright-cyan} fg:${surface1}";
        format = "[ $symbol ($version) ]($style)";
      };

      haskell = {
        symbol = " ";
        style = "bg:${bright-cyan} fg:${surface1}";
        format = "[ $symbol ($version) ]($style)";
      };

      java = {
        symbol = " ";
        style = "bg:${bright-cyan} fg:${surface1}";
        format = "[ $symbol ($version) ]($style)";
      };

      julia = {
        symbol = " ";
        style = "bg:${bright-cyan} fg:${surface1}";
        format = "[ $symbol ($version) ]($style)";
      };

      nodejs = {
        symbol = "";
        style = "bg:${bright-cyan} fg:${surface1}";
        format = "[ $symbol ($version) ]($style)";
      };

      nim = {
        symbol = "󰆥 ";
        style = "bg:${bright-cyan} fg:${surface1}";
        format = "[ $symbol ($version) ]($style)";
      };

      rust = {
        symbol = "";
        style = "bg:${bright-cyan} fg:${surface1}";
        format = "[ $symbol ($version) ]($style)";
      };

      scala = {
        symbol = " ";
        style = "bg:${bright-cyan} fg:${surface1}";
        format = "[ $symbol ($version) ]($style)";
      };

      python = {
        symbol = " ";
        style = "bg:${bright-cyan} fg:${surface1}";
        format = "[ $symbol ($version) ]($style)";
      };

      custom.tex = {
        detect_extensions = ["tex"];
        symbol = "";
        style = "bg:${bright-cyan} fg:${surface1}";
        format = "[ $symbol ]($style)";
      };

      custom.nix = {
        detect_extensions = ["nix"];
        symbol = "󱄅";
        style = "bg:${bright-cyan} fg:${surface1}";
        format = "[ $symbol ]($style)";
      };

      time = {
        disabled = false;
        time_format = "%R"; # Hour:Minute Format
        style = "bg:${blue} fg:${surface1}";
        format = "[   $time ]($style)";
      };
    };
  };
}
