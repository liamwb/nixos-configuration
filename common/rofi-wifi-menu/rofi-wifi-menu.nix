{pkgs, lib, ...}:
let 
  script = pkgs.writeShellApplication {
    name = "rofi-wifi-menu";
    runtimeInputs = with pkgs; [ rofi networkmanagerapplet libnotify ];
    text = builtins.readFile ./rofi-wifi-menu-script.sh;
  };
in
{
  environment.systemPackages = [ script ];
}
