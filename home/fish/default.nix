{pkgs,...}:
{
  # use starship prompt
  imports = [ ../starship ];

  programs.fish = {
    enable = true;
    shellAliases = {
      ls = "lsd";
    };
    functions.yy = ''
      function yy
        set tmp (mktemp -t "yazi-cwd.XXXXXX")
        yazi $argv --cwd-file="$tmp"
        if set cwd (command cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
          cd -- "$cwd"
        end
        rm -f -- "$tmp"
      end
    '';
    shellInitLast = "pokeget random --hide-name | fastfetch --file-raw - -c examples/10.jsonc";
  };

  programs.yazi.enableFishIntegration = true;

  # another prompt option (just for fish)
  # home.packages = [
  #   pkgs.fishPlugins.hydro
  # ];
}
