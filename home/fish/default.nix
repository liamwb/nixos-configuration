{config, pkgs, ...}:

{
  imports = [ ./starship.nix ];
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
  };

  programs.yazi.enableFishIntegration = true;
}
