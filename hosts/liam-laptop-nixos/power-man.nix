{
# see https://nixos.wiki/wiki/Laptop
  services.thermald.enable = true;

  services.tlp = {
    enable = true;
    settings = {
       # helps save long term battery health
       START_CHARGE_THRESH_BAT0 = 40; # 40 and bellow it starts to charge
       STOP_CHARGE_THRESH_BAT0 = 85; # 85 and above it stops charging

    };
  };
}
