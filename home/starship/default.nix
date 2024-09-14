{lib, pkgs, inputs, ...}:
let
  base16 = pkgs.callPackage inputs.base16.lib { };
  theme = (base16.mkSchemeAttrs "${pkgs.base16-schemes}/share/themes/catppuccin-macchiato.yaml").withHashtag;
  base = theme.base00;
  mantle = theme.base01;
  surface0 = theme.base02;
  surface1 = theme.base03;
  surface2 = theme.base04;
  text = theme.base05;
  rosewater = theme.base06;
  lavender = theme.base07;
  red = theme.base08;
  peach = theme.base09;
  yellow = theme.base0A;
  green = theme.base0B;
  teal = theme.base0C;
  blue = theme.base0D;
  mauve = theme.base0E;
  flamingo = theme.base0F;
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
        "[](bg:${rosewater} fg:${red})"
        "$directory"
        "[](fg:${rosewater} bg:${peach})"
        "$git_branch"
        "$git_status"
        "[](fg:${peach} bg:${teal})"
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
        "[](fg:${teal} bg:${blue})"
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
        style = "bg:${rosewater} fg:${surface1}";
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
        style = "bg:${teal} fg:${surface1}";
        format = "[ $symbol ($version) ]($style)";
      };

      elm = {
        symbol = " ";
        style = "bg:${teal} fg:${surface1}";
        format = "[ $symbol ($version) ]($style)";
      };

      git_branch = {
        symbol = "";
        style = "bg:${peach} fg:${surface1}";
        format = "[ $symbol $branch ]($style)";
      };

      git_status = {
        style = "bg:${peach} fg:${surface1}";
        format = "[$all_status$ahead_behind ]($style)";
      };

      golang = {
        symbol = " ";
        style = "bg:${teal} fg:${surface1}";
        format = "[ $symbol ($version) ]($style)";
      };

      gradle = {
        style = "bg:${teal} fg:${surface1}";
        format = "[ $symbol ($version) ]($style)";
      };

      haskell = {
        symbol = " ";
        style = "bg:${teal} fg:${surface1}";
        format = "[ $symbol ($version) ]($style)";
      };

      java = {
        symbol = " ";
        style = "bg:${teal} fg:${surface1}";
        format = "[ $symbol ($version) ]($style)";
      };

      julia = {
        symbol = " ";
        style = "bg:${teal} fg:${surface1}";
        format = "[ $symbol ($version) ]($style)";
      };

      nodejs = {
        symbol = "";
        style = "bg:${teal} fg:${surface1}";
        format = "[ $symbol ($version) ]($style)";
      };

      nim = {
        symbol = "󰆥 ";
        style = "bg:${teal} fg:${surface1}";
        format = "[ $symbol ($version) ]($style)";
      };

      rust = {
        symbol = "";
        style = "bg:${teal} fg:${surface1}";
        format = "[ $symbol ($version) ]($style)";
      };

      scala = {
        symbol = " ";
        style = "bg:${teal} fg:${surface1}";
        format = "[ $symbol ($version) ]($style)";
      };

      python = {
        symbol = " ";
        style = "bg:${teal} fg:${surface1}";
        format = "[ $symbol ($version) ]($style)";
      };

      custom.tex = {
        detect_extensions = ["tex"];
        symbol = "";
        style = "bg:${teal} fg:${surface1}";
        format = "[ $symbol ]($style)";
      };

      custom.nix = {
        detect_extensions = ["nix"];
        symbol = "󱄅";
        style = "bg:${teal} fg:${surface1}";
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
