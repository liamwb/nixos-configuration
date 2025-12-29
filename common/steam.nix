{pkgs, ...}:
{
  environment.systemPackages = with pkgs; [
    mangohud # system monitoring
    protonup-ng  # let's us install fancy proton
  ];

  programs.steam ={
    enable = true;
    gamescopeSession.enable = true;  # may help with upscaling/resolution
  };

  programs.gamemode.enable = true;  # may greatly improve performance

  # enable gamemode, mangohud, or gamescope by adding the launch option
  # gamemoderun %command%, mangohud %command%, or gamescip %command% respectively

  # settings this environment variable means we can install proton simply with `protonup`

  environment.sessionVariables = {
    STEAM_EXTRA_COMPAT_TOOLS_PATHS = 
      "/home/liamwb/.steam/root/compatibilitytoolds.d";
  };

}
