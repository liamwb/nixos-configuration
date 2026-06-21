# This collection of nix packages builds katrain. The code is taken mostly
# from the following pull request on nixpkgs:
# https://github.com/NixOS/nixpkgs/pull/408590/
# with the exception of this default.nix, which is slop. I don't know how to build nix
# packages, so I make no apologies and no guarantees. My thanks to iofq for the PR.
{
  config,
  pkgs,
  lib,
  ...
}:

let
  # Build a custom Python 3 package set with our additions
  customPython = pkgs.python3.override {
    packageOverrides = pself: psuper: {
      asyncgui = pself.callPackage ./asyncgui.nix { };
      asynckivy = pself.callPackage ./asynckivy.nix { };
      ffpyplayer = pself.callPackage ./ffpyplayer.nix { };
      kivymd = pself.callPackage ./kivymd.nix { };
    };
  };

  # Build katrain using this custom Python (which now has .pkgs.kivymd)
  katrain = customPython.pkgs.callPackage ./package.nix {
    python = customPython;
  };

  # Overlay to make katrain available as pkgs.katrain (for the module)
  katrainOverlay = self: super: { katrain = katrain; };

  katrainModule = import ./module.nix;
in
{
  imports = [ katrainModule ];
  nixpkgs.overlays = [ katrainOverlay ];

  # Default configuration – adjust as needed
  programs.katrain = {
    enable = true;
    withWlClipboard = true; # or withXClip for X11
    katago = {
      enable = true;
      package = pkgs.katagoCPU;
    };
  };
}
